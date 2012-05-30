--����NPC
--�ܲ�
--��ͨ

x002091_g_ScriptId	= 2091

--������
x002091_g_Key				=
{
		["do"]					= 100,	--ȷ��
		["undo"]				= 101,	--ȡ��
		["del"]					= 103,	--�Ҿ����˳�����
}

--**********************************
--�¼��������
--**********************************
function x002091_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "��ר��Ϊ����Ӣ�����ֽ���ϴ�ֵ���ʽ���������Ҫɾ����ɫ���˳������Ϳ��������ҡ�" )
		AddNumText( sceneId, x002091_g_ScriptId, "ȷ��", -1, x002091_g_Key["do"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x002091_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x002091_g_Key["do"] then
		--1,		//����ɹ�������ɾ��
		--2,		//�ڰ����в�������ɱ
		--3,		//���״̬
		--4,		//��Ʒ��������ɾ��
		--5,		//ӵ������̵�
		--6,		//ӵ�н���ֵ�
		--7,		//ӵ��ʦͽ��ϵ
		BeginEvent(sceneId)
			local result = QueryDeleteCharState(sceneId,selfId)
			if result == 1 then
				AddText(sceneId,"����ɹ�������ɾ��")
				AddNumText(sceneId,x002091_g_ScriptId,"ȷ��ɾ����ɫ",6,x002091_g_Key["del"])
			end
			if result == 2 then
				AddText(sceneId,"�����˳����ɺ���ܽ��д˲�����")
			end
			if result == 3 then
				AddText(sceneId,"�����ڽ��״̬�����Խ��д˲�����")
			end
			if result == 4 then
				AddText(sceneId,"����������Ʒ��������״̬�޷����д˲�����")
			end
			if result == 5 then
				AddText(sceneId,"����ӵ���̵꣬��ȥ���̵����д˲�����")
			end
			if result == 6 then
				AddText(sceneId,"���к����Ѵ��ڽ��״̬�����Խ��д˲�����")
			end
			if result == 7 then
				AddText(sceneId,"������ʦͽ��ϵ���ڲ����Խ��д˲�����")
			end
			if result == 8 then
					local lefttime = GetLeftDeleteTime(sceneId,selfId)-7
					if lefttime > 0 then
						AddText(sceneId,"���Ľ�ɫ��������������������Խ��д�ɾ����ɫ������")
					else
						AddText(sceneId,"ɾ����ɫ!");
					end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif key == x002091_g_Key["del"] then
		--ExecuteDeleteChar(sceneId, selfId)
		x002091_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )
	end
end

function x002091_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )    
    BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x002091_g_ScriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,eventId)
		UICommand_AddString(sceneId,"OnMsgAccept");
		local str = format("���Ҫɾ����")
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	
	DispatchUICommand(sceneId,selfId, 24)
end

function x002091_OnMsgAccept( sceneId, selfId, targetId, eventId )
    local result = QueryDeleteCharState(sceneId,selfId)
    
    if( 1 == result ) then        
        ExecuteDeleteChar(sceneId, selfId)
    end
    
end
