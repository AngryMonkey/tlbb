--������UI 30��31,103

x600000_g_ScriptId = 600000;
x600000_g_Yinpiao = 40002000

function x600000_OnEnumerate( sceneId, selfId, targetId, sel )
	if( sel == 1 ) then
		GuildCreate(sceneId, selfId, targetId);
	elseif( sel == 2 ) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --���ó�����������
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 103)
		--���ÿͻ��˼�¼NPC��Ϣ����ʾ����
		CityApply(sceneId, selfId)
		GuildList(sceneId, selfId, targetId);
	elseif( sel == 3 ) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 30)
	elseif( sel == 4 ) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 31)
	elseif( sel == 5 )then
		local ret = CheckPlayerCanApplyCity(sceneId, selfId);
		if ret==1 then 
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId) --���ó�����������
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 101)
			--���ÿͻ��˼�¼NPC��Ϣ����ʾ����
			CityApply(sceneId, selfId)
		elseif ret==-1 then
			BeginEvent(sceneId)
				AddText(sceneId,"���İ���Ѿ�ռ�г����ˣ�")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	elseif( sel == 6 ) then
		--�Ƿ�������
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113)
		if haveImpact == 1 then
				BeginEvent(sceneId)
					strText = "�Բ���,�����ڴ�������״̬��"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end
		-- �����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
		if GetItemCount(sceneId, selfId, x600000_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  ����������Ʊ���������̣��Ҳ��ܰ����㡣" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		CityMoveTo(sceneId, selfId)
	end
	
end
