--����NPC ���ϼӹ�����NPC   �������ܣ�1���ϼӹ����ܵ�ѧϰ 2������ϼӹ�����
--������
--��ͨ

--�ű���
x000141_g_ScriptId = 000141

--�̵���
x000141_g_shoptableindex = 167

--��ӵ�е��¼�Id�б�
--estudy_cailiaojiagong = 713538


--��ӵ�е��¼�ID�б�
x000141_g_eventList={713538}
--**********************************
--�¼��б�
--**********************************
function x000141_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  ��ѧϰ���ϼӹ������𣿵������ġ�ѧϰ���ϼӹ�����ť���Ϳ���ѧϰ���ϼӹ������ˡ�")
	AddText(sceneId,"  ���ϼӹ���Ҫ�������ĺͺ��ģ����������������ĺϳɳ�Ʒ������Щ��Ʒ����ϰ���ա�����ͷ�����������ܱ���ģ��������������Ĺ��ա�����ͷ�����������ܣ���ô��һ��Ҫѧϰ���ϼӹ���")
	AddText(sceneId,"  ע�⣺ѧϰ�����ϼӹ�����Ҫ����#{_EXCHG10000}�������Ǵ��ˣ�")
	for i, eventId in x000141_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x000141_g_ScriptId,"������ϼӹ��䷽",7, 99 )
	AddNumText( sceneId, x000141_g_ScriptId, "���ϼӹ�����", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000141_OnDefaultEvent( sceneId, selfId,targetId )
	x000141_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000141_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{HELP_CLJG}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == 99	then
		DispatchShopItem( sceneId, selfId,targetId, x000141_g_shoptableindex )
	end
	for i, findId in x000141_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000141_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000141_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000141_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�������Ѿ���������
--**********************************
function x000141_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ύ�����������
--**********************************
function x000141_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--�����¼�
--**********************************
function x000141_OnDie( sceneId, selfId, killerId )
end
