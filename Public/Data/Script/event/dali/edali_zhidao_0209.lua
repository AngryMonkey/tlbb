--ѧϰ����
--�Ŵ����ɼ��ܴ���

--MisDescBegin
--�ű���
x210209_g_ScriptId = 210209

--�����
x210209_g_MissionId = 449

--�������
x210209_g_MissionKind = 13

--������߱��
x210209_g_ItemId = 40002108

--����ȼ�
x210209_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210209_g_IfMissionElite = 0

--������
x210209_g_MissionName="ѧϰ����"
x210209_g_MissionInfo="  ȥ�ҾŴ����ɵĵ���ѧϰһ���"
x210209_g_MissionTarget="ѧϰ���ܡ�"
x210209_g_MissionComplete="  ��Ȼ���������Ƽ��ţ����Ҿͽ̸���һ�����ּ��ܣ�Ҫ�ú�ѧϰ�������ϰ�ſ��ԡ�"
x210209_g_Name_0="����ʦ"

--hzp 2009-2-18 begin<<
--x210209_g_Name_1="����"
--x210209_g_Name_2="ʯ��"
--x210209_g_Name_3="����"
--x210209_g_Name_4="�Ż�"
--x210209_g_Name_5="·����"
--x210209_g_Name_6="������"
--x210209_g_Name_7="��̰"
--x210209_g_Name_8="����˪"
--x210209_g_Name_9="�̨����"

x210209_g_XinShouJiNeng = {
{name="����",			skill="ѧϰ�⹦����"},
{name="ʯ��",			skill="ѧϰ�������"},
{name="����",			skill="ѧϰҪ������"},
{name="�Ż�",			skill="ѧϰ�ھ�����"},
{name="·����",		skill="ѧϰ��������"},
{name="������",		skill="ѧϰ�ڹ�����"},
{name="��̰",			skill="ѧϰ��������"},
{name="����˪",		skill="ѧϰ��������"},
{name="�̨����",	skill="ѧϰȼ������"},
}
-->>end
--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210209_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName(sceneId,targetId) ~= x210209_g_Name_0 then
		x210209_OnContinue( sceneId, selfId, targetId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x210209_OnEnumerate( sceneId, selfId, targetId )
	
	if x210209_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[1].name then
			if	HaveSkill(  sceneId, selfId, 241)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[1].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[2].name	 then
			if	HaveSkill(  sceneId, selfId, 242)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[2].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[3].name	 then
			if	HaveSkill(  sceneId, selfId, 243)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[3].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[4].name	then
			if	HaveSkill(  sceneId, selfId, 244)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[4].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[5].name then
			if	HaveSkill(  sceneId, selfId, 245)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[5].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[6].name then
			if	HaveSkill(  sceneId, selfId, 246)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[6].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[7].name then
			if	HaveSkill(  sceneId, selfId, 247)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[7].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[8].name then
			if	HaveSkill(  sceneId, selfId, 248)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[8].skill,6,-1);
			end
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[9].name then
			if	HaveSkill(  sceneId, selfId, 249)<0	then
				AddNumText(sceneId, x210209_g_ScriptId,x210209_g_XinShouJiNeng[9].skill,6,-1);
			end
		end
	end
	
	if GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[1].name then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"����������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"������ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"������������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"���ֹ�ɲ",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[2].name	 then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"��������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"����ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"����������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"�������",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[3].name	 then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"ؤ������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"ؤ��ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"ؤ��������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"ؤ���ܶ�",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[4].name	then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"�䵱������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"�䵱��ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"�䵱��������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"�䵱�ɷ�",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[5].name then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"����������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"������ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"������������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"����������",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[6].name then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"����������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"������ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"������������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"���޴���",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[7].name then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"����������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"������ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"������������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"��������",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[8].name then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"��ɽ������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"��ɽ��ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"��ɽ��������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"�����ɽ",11,13);
	elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[9].name then
		--������ɽ���
		AddNumText(sceneId, x210209_g_ScriptId,"��ң������",11,10);
		AddNumText(sceneId, x210209_g_ScriptId,"��ң��ս����ɫ",11,11);
		AddNumText(sceneId, x210209_g_ScriptId,"��ң��������ɫ",11,12);
		AddNumText(sceneId, x210209_g_ScriptId,"�R����ң",11,13);
	end

end

--**********************************
--����������
--**********************************
function x210209_CheckAccept( sceneId, selfId )
	--��Ҫ�е��߲��ܽ�
	if	HaveItemInBag ( sceneId, selfId, x210209_g_ItemId)>0	then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210209_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210209_g_MissionId, x210209_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������ѧϰ����",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x210209_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210209_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210209_OnContinue( sceneId, selfId, targetId )
    --�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210209_g_MissionName)
		AddText(sceneId,x210209_g_MissionComplete)
		AddText(sceneId,"�㽫ѧ��һ���µļ���")
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210209_g_ScriptId,x210209_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210209_CheckSubmit( sceneId, selfId, selectRadioId )
	if	HaveItemInBag (  sceneId, selfId, x210209_g_ItemId)==1	then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x210209_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210209_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		DelMission( sceneId, selfId, x210209_g_MissionId )
		MissionCom( sceneId, selfId, x210209_g_MissionId )
		if  GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[1].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 241) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 241)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ��⹦����"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[2].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 242) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 242)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[3].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 243) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 243)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ�ؤ�����ּ��ܣ�Ҫ������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[4].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 244) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 244)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��䵱���ּ��ܣ��ھ�����"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[5].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 245) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 245)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ���������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[6].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 246) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 246)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ��������ּ��ܣ��ڹ�����"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[7].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 247) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 247)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ����������ּ��ܣ���������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[8].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 248) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 248)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ���ɽ���ּ��ܣ���������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif	GetName(sceneId,targetId) == x210209_g_XinShouJiNeng[9].name	then
			--�ж�����ǲ����Ѿ�ѧ����������ܣ����˾Ͳ�����ѧϰ��
			if  HaveSkill(sceneId, selfId, 249) > 0  then
				return
			end
			AddSkill(  sceneId, selfId, 249)
			BeginEvent(sceneId)
				strText = "��ѧ���µļ��ܣ���ң���ּ��ܣ�ȼ������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
		--�۳�������Ʒ
		DelItem( sceneId, selfId, x210209_g_ItemId, 1 )
		--ѧϰ�ɹ�������Ч
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	end
	Msg2Player(  sceneId, selfId,"#Y�������ѧϰ����",MSG2PLAYER_PARA )
end

--**********************************
--ɱ����������
--**********************************
function x210209_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210209_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210209_OnItemChanged( sceneId, selfId, itemdataId )
end
