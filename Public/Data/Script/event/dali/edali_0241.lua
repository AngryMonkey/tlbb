--����ָ��

--MisDescBegin
--�ű���
x210241_g_ScriptId	= 210241
--MisDescEnd

--������Ϣ���������ƣ���ɫ������NumText�����������꣬����������
x210241_g_MPInfo		=
{
	{ nam="������", des="#{event_dali_mp_sl}", key=1020, x=187, z=122, npc="����"			},
	{ nam="����",   des="#{event_dali_mp_mj}", key=1021, x=130, z=121, npc="ʯ��"			},
	{ nam="ؤ��",   des="#{event_dali_mp_gb}", key=1022, x=126, z=135, npc="����"			},
	{ nam="�䵱��", des="#{event_dali_mp_wd}", key=1023, x=134, z=120, npc="������"		},
	{ nam="������", des="#{event_dali_mp_em}", key=1024, x=192, z=129, npc="·����"		},
	{ nam="������", des="#{event_dali_mp_xx}", key=1025, x=134, z=120, npc="������"		},
	{ nam="������", des="#{event_dali_mp_tl}", key=1026, x=189, z=124, npc="��̰"			},
	{ nam="��ɽ��", des="#{event_dali_mp_ts}", key=1027, x=131, z=124, npc="����˪"		},
	{ nam="��ң��", des="#{event_dali_mp_xy}", key=1028, x=188, z=133, npc="�̨����"	},
}

--**********************************
--������ں���
--**********************************
function x210241_OnDefaultEvent( sceneId, selfId, targetId )
  
	local	key	= GetNumText()
	local	MP

	if key == 1010 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{event_dali_mp_dlg}" )
			for _, MP in x210241_g_MPInfo do
				AddNumText( sceneId, x210241_g_ScriptId, MP.nam, 11, MP.key )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	else
		for _, MP in x210241_g_MPInfo do
			if key == MP.key then
				x210241_MsgBox( sceneId, selfId, targetId, MP.des )
				CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, MP.x, MP.z, MP.npc )
				break
			end
		end
	end

end

--**********************************
--�о��¼�
--**********************************
function x210241_OnEnumerate( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		AddNumText( sceneId, x210241_g_ScriptId, "����β���ȥ�Ŵ�����", 11, 1010 )
	end

end

--**********************************
--����������
--**********************************
function x210241_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210241_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210241_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210241_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210241_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x210241_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x210241_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x210241_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210241_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--Message Box
--**********************************
function x210241_MsgBox( sceneId, selfId, targetId, Msg )

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end
