--����ɽNPC
--�α���
--����

x042513_g_scriptId	= 042513

--**********************************
--�¼��������
--**********************************
function x042513_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_25}" )
		AddNumText(sceneId, x042513_g_scriptId, "#{HYS_20071224_26}",6,0)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x042513_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5903, 0)
	end
end
