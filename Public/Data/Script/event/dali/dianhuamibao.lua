-- 电话密保领取赠品
-- 创建人[ LB JIA 2008-7-29 10:21:55]

x210245_g_ScriptId = 210245

--奖励标记
x210245_g_flag = MF_DianHuaMiBao_Gift

--奖励润魂丹
x210245_g_Gift = 30008044
--奖励安保金牌
--x210245_g_AnBaoJinPai = 30008046	--安保金牌 
x210245_g_AnBaoDaLiBao = 30008047  --安保大礼包

--**********************************
--列举事件
--**********************************
function x210245_OnEnumerate( sceneId, selfId, targetId )
		AddNumText( sceneId, x210245_g_ScriptId, "#{DHMB_0728_17}", 2, 110)
		--AddNumText( sceneId, x210245_g_ScriptId, "#{DHMB_8801_19}", 2, 112) 
		AddNumText( sceneId, x210245_g_ScriptId, "#{DHMB_0728_18}", 11, 111 )
		--AddNumText( sceneId, x210245_g_ScriptId, "#{DHMB_8801_20}", 11, 113 )	--112,113为安保大礼包赠送
end

function x210245_OnDefaultEvent( sceneId, selfId, targetId )
	local	dkey	= GetNumText()
			
	if dkey == 110 then
		x210245_MsgBox(sceneId, selfId, "#{RHD_80904_01}") --暂时关闭领取润魂丹，38667
--		local ismibao = IsPhoneMibao(sceneId, selfId)
--   		local ishadzengping = GetMissionFlag(sceneId, selfId, MF_DianHuaMiBao_Gift)
--   		local runhundan_point = GetMissionData(sceneId, selfId, MD_EX_HUMAN_QIANNENG_SUBJOIN)
--
--	    if ismibao == 0 then
--	    	x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_09}")
--	    	
--      elseif ishadzengping == 1 or runhundan_point > 0 then
--        	SetMissionFlag(sceneId, selfId, MF_DianHuaMiBao_Gift, 1)
--        	x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_10}")
--        
--      else
--        	--检查背包空间是否足够
--       	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
--					x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_11}")
--					return
--				end
--			
--            --给物品，首先置领取标志为1
--        SetMissionFlag(sceneId, selfId, MF_DianHuaMiBao_Gift, 1)
--				local ret1 = TryRecieveItem(sceneId, selfId, x210245_g_Gift, 1)
--				if ret1 < 0 then
--					x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_11}")
--					return
--				end
--			-----------------------测试代码----------------------
--			--SetMissionFlag(sceneId, selfId, MF_DianHuaMiBao_Gift, 0)
--			-----------------------------------------------------
--			
--				AuditDianHuaMiBaoZengPing(sceneId, selfId,x210245_g_Gift)
--				x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_12}")
--      end
	elseif dkey == 111 then
		x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_13}")
	elseif dkey == 113 then
		x210245_MsgBox(sceneId, selfId, "#{DHMB_8801_24}#r#{DHMB_8801_23}")
	elseif dkey == 112 then
		--local HaveAnbaojinpai =HaveItemInBag(sceneId, selfId, x210245_g_AnBaoJinPai)
		local ismibao = IsPhoneMibao(sceneId, selfId)
		local IsMacBangding = IsMacBangDing(sceneId, selfId)
		local IsIpBangding = IsIPBangDing(sceneId, selfId)
		local IsGetDaLiBao = GetMissionFlag(sceneId, selfId, MF_AnBaoDaLiBao_Gift)

		--if HaveAnbaojinpai == -1 then
		if ismibao == 0 then
			x210245_MsgBox(sceneId, selfId,"#{DHMB_8801_22}")
		elseif IsMacBangding == 0 and IsIpBangding == 0 then
			x210245_MsgBox(sceneId, selfId,"#{DHMB_8801_22}")
		else
			if IsGetDaLiBao == 1 then
				x210245_MsgBox(sceneId, selfId, "#{DHMB_8801_25}")
				return
			end
			if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
				x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_11}")
				return
			end	
			--首先删物品
			--local delret = DelItem(sceneId, selfId, x210245_g_AnBaoJinPai, 1)
			--if delret < 0 then	 --如果删除失败,将不会给玩家大礼包
				--return
			--end
			
			--给物品
			local ret = TryRecieveItem(sceneId,selfId, x210245_g_AnBaoDaLiBao, 1)
			if ret < 0 then
				x210245_MsgBox(sceneId, selfId, "#{DHMB_0711_11}")
				return
			end
			
			SetMissionFlag(sceneId, selfId, MF_AnBaoDaLiBao_Gift, 1)
			AuditAnBaoJinPaiZengPing(sceneId, selfId,x210245_g_AnBaoDaLiBao)		--记录安保大礼包的领取
			x210245_MsgBox(sceneId, selfId, "#{DHMB_8801_23}")
		end
	end	
	
end

--**********************************
--消息提示
--**********************************
function x210245_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--玩家上线之后的邮件提示，scene.lua的x888888_OnScenePlayerLogin调用到这里
--**********************************
function x210245_SendMail( sceneId, selfId, nowtime )

	LuaFnSendSystemMail( sceneId, GetName(sceneId, selfId), "#{DHMB_08820_01}" )   -- 发邮件

end
