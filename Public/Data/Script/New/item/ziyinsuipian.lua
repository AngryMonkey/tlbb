--890012������Ƭ�һ�
x890012_g_ScriptId = 890012

x890012_g_itemId = 39901004

x890012_g_itemIdx = 39901005

--**********************************
--�¼��б�
--**********************************
function x890012_UpdateEventList( sceneId, selfId,targetId )
	  if GetItemCount(sceneId, selfId, x890012_g_itemId) < 10 then
		BeginEvent(sceneId)
			 AddText( sceneId, "������ӵ��10��������Ƭ�Ҳ��ܰ���һ���" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	  if LuaFnDelAvailableItem(sceneId, selfId, x890012_g_itemId, 10) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "������ӵ��10��������Ƭ�Ҳ��ܰ���һ�,������Ʒ�Ƿ�������" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
		 
		 TryRecieveItem( sceneId, selfId, x890012_g_itemIdx, 1 )
		 BeginEvent(sceneId)
			 AddText( sceneId, "��ϲ���ɹ��һ���#cff99cc�����飡" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
end
--**********************************
--�¼��������
--**********************************
function x890012_OnDefaultEvent( sceneId, selfId,targetId )
	x890012_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x890012_OnEventRequest( sceneId, selfId, targetId, eventId )
end