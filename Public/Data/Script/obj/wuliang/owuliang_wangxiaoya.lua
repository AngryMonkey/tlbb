--��СѾ

--�ű���
x006011_g_scriptId = 006011
x006011_g_NianShouJieShao = "  #{NSBS_20071228_13}"

--**********************************
--�¼��������
--**********************************
function x006011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����Ҳ�Ҫ���·�����Ҫ���ȥ�����ˣ���ô������������")
		--CallScriptFunction( 050054, "OnEnumerate",sceneId, selfId, targetId )
		--AddNumText( sceneId, x006011_g_scriptId, "���޻����", 11, 102 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x006011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101 then
		CallScriptFunction( 050054, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 102 then
		BeginEvent(sceneId)
			AddText( sceneId, x006011_g_NianShouJieShao )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end




