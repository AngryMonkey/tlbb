--�˽�Ŵ�������ɫ

--�ű���
x210237_g_ScriptId	= 210237

--������Ϣ(�������ƣ���ɫ���������������꣬���������ƣ���������)
x210237_g_mpInfo		= {}
x210237_g_mpInfo[0]	= { "��������", "#{OBJ_dali_0045}", 189, 124, "��̰",    185, 128 }
x210237_g_mpInfo[1]	= { "�����ҡ�", "#{OBJ_dali_0046}", 192, 129, "·����",  185, 128 }
x210237_g_mpInfo[2]	= { "��ؤ�", "#{OBJ_dali_0047}", 126, 135, "����",    133, 130 }
x210237_g_mpInfo[3]	= { "�����̡�", "#{OBJ_dali_0048}", 130, 121, "ʯ��",    133, 130 }
x210237_g_mpInfo[4]	= { "�����֡�", "#{OBJ_dali_0049}", 187, 122, "����",    185, 128 }
x210237_g_mpInfo[5]	= { "����ɽ��", "#{OBJ_dali_0050}", 131, 124, "����˪",  133, 130 }
x210237_g_mpInfo[6]	= { "���䵱��", "#{OBJ_dali_0051}", 127, 131, "�Ż�",    133, 130 }
x210237_g_mpInfo[7]	= { "����ң��", "#{OBJ_dali_0052}", 188, 133, "�̨����",185, 128 }
x210237_g_mpInfo[8]	= { "�����ޡ�", "#{OBJ_dali_0053}", 134, 120, "������",  133, 130 }

--������ں���
--**********************************
function x210237_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local	mp
	local	i		= 0
	
	--�˽�������ɫ
	if key == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "  �˽�Ŵ�������ɫ��" )
			for i, mp in x210237_g_mpInfo do
				AddNumText( sceneId, x210237_g_ScriptId, mp[1], 11, i+1 )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--ѡ�������
	elseif key >= 1 and key <= 9 then
		mp	= x210237_g_mpInfo[key-1]
		BeginEvent( sceneId )
			AddText( sceneId, mp[2] )
			AddNumText( sceneId, x210237_g_ScriptId, "����ȥ��������", 9, -1*key )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--����ȥ��������
	elseif key >= -9 and key <= -1 then
		mp	= x210237_g_mpInfo[-1*key-1]
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, mp[3], mp[4], mp[5] )
		SetPos( sceneId, selfId, mp[6], mp[7] )
		
		--�رս���
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	--����
	else
		return
	end
end

--**********************************
--�о��¼�
--**********************************
function x210237_OnEnumerate( sceneId, selfId, targetId )
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		AddNumText( sceneId, x210237_g_ScriptId, "�˽�Ŵ�������ɫ", 11, 100 )
	end
end

--**********************************
--����������
--**********************************
function x210237_CheckAccept( sceneId, selfId )
	--��Ҫ10�����ܽ�
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210237_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210237_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210237_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210237_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x210237_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x210237_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210237_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210237_OnItemChanged( sceneId, selfId, itemdataId )
end
