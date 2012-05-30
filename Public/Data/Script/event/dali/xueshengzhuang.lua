--��������
--����ʦѰ�����ү
--MisDescBegin
--�ű���
x210246_g_ScriptId = 210246

--��������NPC����
x210246_g_Position_X=172.7304
x210246_g_Position_Z=146.4640
x210246_g_SceneID=2
x210246_g_Name	="���ү"

--����ȼ�
x210246_g_LevelLimit = 10

--������
x210246_g_MissionName="��������"
x210246_g_MissionNameTip="������������"
x210246_g_starttime = 20080917
x210246_g_endtime = 20080928

--������Ӽ���id������
x210246_g_ItemData = {nItemId = 10124122, nItemNum = 1}
x210246_g_SpecificId = 49

--**********************************
--������ں���
--**********************************
function x210246_OnDefaultEvent( sceneId, selfId, targetId )

	if GetNumText() == 1 then
		local strOutMsg = ""
		local CurLevel = LuaFnGetLevel( sceneId, selfId )
		local nBagNum = LuaFnGetPropertyBagSpace(sceneId, selfId)
		local bHave = 0
		if CurLevel < 10 then       --�ȼ�����10��
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_01}")
			return
		end
		
		local bHave = GetMissionFlag(sceneId, selfId, MF_Xueshengzhuang_flag)
		if bHave == 1 then      --�Ѿ��μӹ���
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_02}")
			return
		end
		
		if nBagNum < 1 then         --����������һ��
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_03}")
			x210246_Tip(sceneId, selfId, "#{TTXS_80821_04}")
			return
		end
		

		--����Ʒ
		BeginAddItem(sceneId)                --����Ʒ
			AddItem(sceneId, x210246_g_ItemData.nItemId, x210246_g_ItemData.nItemNum)
		local canAdd = EndAddItem(sceneId,selfId)						
		if canAdd > 0 then
			AddItemListToHuman(sceneId, selfId)	
			SetMissionFlag(sceneId, selfId, MF_Xueshengzhuang_flag, 1)
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_05}")
			x210246_Tip(sceneId, selfId, "#{TTXS_80821_06}")
			--������Ч
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x210246_g_SpecificId, 0);
			CreateXSzhuangAudit(sceneId, selfId, x210246_g_ItemData.nItemNum)
		end
	
	elseif GetNumText() == 2 then
		x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_07}")
	end
end

--**********************************
--�о��¼�
--**********************************
function x210246_OnEnumerate( sceneId, selfId, targetId )

	local nDay = GetTime2Day(sceneId)
	if (nDay >= x210246_g_starttime and nDay <= x210246_g_endtime) then
		AddNumText(sceneId, x210246_g_ScriptId, x210246_g_MissionName, 6, 1);
		AddNumText(sceneId, x210246_g_ScriptId, x210246_g_MissionNameTip, 11, 2);
	end

end

--**********************************
--����������
--**********************************
function x210246_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210246_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210246_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210246_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210246_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x210246_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

function x210246_Msg( sceneId, selfId, targetId, strOutMsg)
	BeginEvent( sceneId )
		AddText(sceneId, strOutMsg)
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end

function x210246_Tip( sceneId, selfId, strOutMsg)
	BeginEvent( sceneId )
		AddText(sceneId, strOutMsg)
	EndEvent( sceneId )
	DispatchMissionTips(sceneId, selfId);
end
