--¥��NPC �����
--Created by ��ΰ

--�ű���
x001168_g_ScriptId = 001168
x001168_g_eventList={808039} -- seek_treasureѰ��
x001168_g_moster_album_id = 30505192;
x001168_g_exchange_num = 100;
x001168_g_clothing_id = 
{
		10124113,           --������ʱװ 0
		10124114,           --������ʱװ 1
		10124115,           --ؤ����ʱװ 2
		10124117,           --�䵱��ʱװ 3
		10124116,           --������ʱװ 4
		10124118,           --������ʱװ 5
		10124121,           --������ʱװ 6
		10124119,           --��ɽ��ʱװ 7
		10124120,           --��ң��ʱװ 8
}
--**********************************
--�¼��б�
--**********************************
function x001168_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLXB_8815_06}")
		for i, eventId in x001168_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText(sceneId, x001168_g_ScriptId, "#{LLXB_8820_01}", 6, 100);  --�һ�
		AddNumText(sceneId, x001168_g_ScriptId, "#{LLXB_8820_02}", 11, 101); --�һ�����
		--[tx45411]AddNumText(sceneId, x001168_g_ScriptId, "#{NSRQ_081110_2}", 11, 999); --zchw
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001168_OnDefaultEvent( sceneId, selfId,targetId )
	x001168_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001168_OnEventRequest( sceneId, selfId, targetId, eventId )
	--[tx45411]if GetNumText() == 999 then
	--	x001168_ShowMsg(sceneId, selfId, targetId, "#{NSRQ_081110_3}")
	--[/tx45411]end
	for i, findId in x001168_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001168_g_ScriptId )
			return
		end
	end
	if GetNumText() == 100 then
		local num = LuaFnGetAvailableItemCount(sceneId, selfId, x001168_g_moster_album_id);
		if num == 0 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_03}")
			return
		elseif num < 100 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_04}")
			return
		end
		if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{SJQM_8815_06}")
			return 		
		end
		--������������
		local menpaiId = GetMenPai(sceneId, selfId);
		if menpaiId < 0 or menpaiId > 8 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_06}")
			return
		end
		local nItemBagIndexalbum = GetBagPosByItemSn(sceneId, selfId, x001168_g_moster_album_id)
		local szTransferalbum = GetBagItemTransfer(sceneId,selfId, nItemBagIndexalbum)
		-- ok �õ�������������Ӧ�ĸ߼�ʱװ
		if LuaFnDelAvailableItem(sceneId, selfId, x001168_g_moster_album_id, x001168_g_exchange_num) == 1 then
			local clothingId = x001168_g_clothing_id[menpaiId+1];
			local ret = TryRecieveItem( sceneId, selfId, clothingId, QUALITY_MUST_BE_CHANGE);
			if ret > -1 then
				-- ��
				if LuaFnItemBind(sceneId, selfId, ret) ~= 1 then
					x001168_ShowMsg(sceneId, selfId, targetId, "��ʧ�ܣ�")
					return
				end
				-- ��ʾ
				BeginEvent(sceneId)
					AddText(sceneId, "�һ��߼�����ʱװ�ɹ���")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				Msg2Player(sceneId, selfId, "�һ��߼�����ʱװ�ɹ���", 8)
				--�һ��ɹ���������Ч
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
				
				--���Ź���
				local PlayerName = GetName(sceneId,selfId)
				local szTransferEquip = GetBagItemTransfer(sceneId,selfId, ret)
				local str = format("#{_INFOUSR%s}#{GWXCSZGG_1}#{_INFOMSG%s}#{GWXCSZGG_2}#{_INFOMSG%s}#{GWXCSZGG_3}",PlayerName,szTransferalbum,szTransferEquip)
				BroadMsgByChatPipe( sceneId, selfId, str, 4 )
				-- ��־
				AuditExchangeMenpaiSuit(sceneId, selfId, menpaiId, clothingId);
			end
		end
	elseif GetNumText() == 101 then
		x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_05}")
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001168_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x001168_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			x001168_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001168_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001168_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
--**********************************
--��ʾ��Ϣ
--**********************************
function x001168_ShowMsg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)	
end
