-- created by 左春伟

x400959_g_ScriptId = 400959; --脚本号
x400959_g_name	="车传福";

--传送目标
x400959_g_transfer_target =
{
	[1] = {x = 216, z = 340, scene_num = 0}, 		--洛阳
	[2] = {x = 330, z = 248, scene_num = 1}, 		--苏州
	[3] = {x = 378, z = 187, scene_num = 2}, 		--大理
	[4] = {x = 206, z = 266, scene_num = 34}, 	--南海
	[5] = {x = 186, z = 43, scene_num = 28},		--南诏
	[6] = {x = 158, z = 113, scene_num = 22}, 	--长白山
}

-- 收费金额
x400959_g_transfer_cost = 5000; -- 50银交子

--**********************************
--事件交互入口
--**********************************
function x400959_OnDefaultEvent( sceneId, selfId, targetId )
	x400959_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x400959_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "#{SFCS_80828_01}" );
		AddNumText(sceneId, x400959_g_ScriptId, "洛阳", 9, 1);
		AddNumText(sceneId, x400959_g_ScriptId, "苏州", 9, 2);
		AddNumText(sceneId, x400959_g_ScriptId, "大理", 9, 3);
		AddNumText(sceneId, x400959_g_ScriptId, "南海", 9, 4);
		AddNumText(sceneId, x400959_g_ScriptId, "南诏", 9, 5);
		AddNumText(sceneId, x400959_g_ScriptId, "长白山", 9, 6);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--事件列表选中一项
--**********************************
function x400959_OnEventRequest( sceneId, selfId, targetId, eventId )
	--跑商相关
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--队伍相关
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  非常抱歉，由于路途太过遥远，我们这里运输能力有限，所以不接受组队传送，请您离开队伍单独前来吧！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "  你有漕运货舱在身，我们驿站不能为你提供传送服务。")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--
	local id = GetNumText();
	if id >=1 and id <= 6 then
		BeginEvent(sceneId)
			--"本次传送收取50银交子，你要传送吗？"
			AddText(sceneId, "#{FFCS_081210_1}")
			if id == 1 then	
				AddNumText(sceneId, x400959_g_ScriptId, "确定", 0, 11);
			elseif id == 2 then
				AddNumText(sceneId, x400959_g_ScriptId, "确定", 0, 21);
			elseif id == 3 then
				AddNumText(sceneId, x400959_g_ScriptId, "确定", 0, 31);
			elseif id == 4 then
				AddNumText(sceneId, x400959_g_ScriptId, "确定", 0, 41);
			elseif id == 5 then
				AddNumText(sceneId, x400959_g_ScriptId, "确定", 0, 51);
			elseif id == 6 then
				AddNumText(sceneId, x400959_g_ScriptId, "确定", 0, 61);
			end
			AddNumText(sceneId, x400959_g_ScriptId, "取消", 0, 100);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 100 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	else
		local index = floor(id/10);
		local pos_x = x400959_g_transfer_target[index]["x"];
		local pos_z = x400959_g_transfer_target[index]["z"];
		local scene_num = x400959_g_transfer_target[index]["scene_num"];
			
		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)

		--钱够吗？
		if (nMoneyJZ + nMoney) >= x400959_g_transfer_cost then 
				
			-- 收费
			-- 使用带优先级的金钱消耗函数
			if LuaFnCostMoneyWithPriority (sceneId, selfId, x400959_g_transfer_cost) == -1 then
				BeginEvent(sceneId)
					AddText(sceneId, "收费失败！");
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			else
				-- 传送
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, scene_num, pos_x, pos_z); 
			end

		-- 钱不够
		else
			BeginEvent(sceneId)
				AddText(sceneId, "金钱不足");
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			return

		end
	end	
end
