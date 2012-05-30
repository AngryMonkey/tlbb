--����NPC
--�غ���
--��ͨ

x000125_g_ScriptId	= 125

--������
x000125_g_Key				=
{
		["do"]					= 100,	--ȷ��
		["undo"]				= 101,	--ȡ��
		["del"]					= 103,	--�Ҿ����˳�����
		["hlp"]					= 104,	--����
}

--**********************************
--�¼��������
--**********************************
function x000125_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ��ר��Ϊ����Ӣ�����ֽ���ϴ�ֵ���ʽ���������Ҫɾ����ɫ���˳��������Ϳ��������ҡ�" )
		AddNumText( sceneId, x000125_g_ScriptId, "����ɾ����ɫ", -1, x000125_g_Key["do"] )
		AddNumText( sceneId, x000125_g_ScriptId, "����ɾ����ɫ", 11, x000125_g_Key["hlp"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x000125_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x000125_g_Key["do"] then
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
				AddText(sceneId,"  ����ϴ�֣��˳�������")
				AddNumText(sceneId,x000125_g_ScriptId,"�Ҿ����˳�����",6,x000125_g_Key["del"])
			end
			if result == 2 then
				AddText(sceneId,"  �㻹�ڰ����У�����������������")
			end
			if result == 3 then
				AddText(sceneId,"  �㻹�ڽ��״̬������������������")
			end
			if result == 4 then
				AddText(sceneId,"  ������Ʒ�Ѿ�����������������������")
			end
			if result == 5 then
				AddText(sceneId,"  ��ӵ������̵꣬����������������")
			end
			if result == 6 then
				AddText(sceneId,"  ��ӵ�н���ֵܣ�����������������")
			end
			if result == 7 then
				AddText(sceneId,"  ��ӵ��ʦͽ��ϵ������������������")
			end
			if result == 8 then
					local lefttime = GetLeftDeleteTime(sceneId,selfId)-11
					if lefttime > 0 then
						AddText(sceneId,"  ������������ʱ��δ��������" ..lefttime.."�졣")
					else
						AddText(sceneId,"  �㻹û����������������");
					end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif key == x000125_g_Key["del"] then
		--ExecuteDeleteChar(sceneId, selfId)
		x000125_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )
		
	elseif key == x000125_g_Key["hlp"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_089}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return

	end
end

function x000125_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )    
  BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x000125_g_ScriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,eventId)
		UICommand_AddString(sceneId,"OnMsgAccept");
		local str = format("��ȷ��Ҫɾ����ɫ��")
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	
	DispatchUICommand(sceneId,selfId, 24)
end

function x000125_OnMsgAccept( sceneId, selfId, targetId, eventId )
    local result = QueryDeleteCharState(sceneId,selfId)
    
    if( 1 == result ) then        
        ExecuteDeleteChar(sceneId, selfId)
    end
    
end
