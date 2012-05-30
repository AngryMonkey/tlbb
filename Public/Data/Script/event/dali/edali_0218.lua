--�������� ������һֻ����
--��ɫ�ȼ�С��10���͸�һֻ���ӣ�һ����ɫһ��
--MisDescBegin
--�ű���
x210218_g_ScriptId = 210218

--�����
x210218_g_MissionId = 458

--����Ŀ��npc
x210218_g_Name	="��ƮƮ" 

--�������
x210218_g_MissionKind = 13

--����ȼ�
x210218_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210218_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210218_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

x210218_g_PetDataID = 3000

--�����ı�����
x210218_g_MissionName="����Ҫֻ����"
x210218_g_MissionInfo="�ðɣ������������ģ��͸���һֻ���Ӱɣ���Ҫ�úõİ�������"  --��������
x210218_g_MissionTarget="    ����һ��ƮƮ�㡣"		--����Ŀ��
x210218_g_ContinueInfo="������������������ɰ���һֻ����Ҫ�ú��չ�����"		--δ��������npc�Ի�
x210218_g_MissionComplete="�ڴ���ú��档"					--�������npc˵���Ļ�

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210218_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
		return
	end
	
	local ret, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, x210218_g_PetDataID, -1, 0) --���������һֻ����
	if ret == 1 then 
		--�¸����ڣ���ʾ���һЩ��
		BeginEvent(sceneId)
		AddText(sceneId,x210218_g_ContinueInfo)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		--�������
		MissionCom( sceneId,selfId, x210218_g_MissionId )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ�����Я�����������ˡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210218_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
   	return 
	end
  --����ѽӴ�����
  --else
  if IsHaveMission(sceneId,selfId,x210218_g_MissionId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName,2,-1);
    --���������������
    elseif x210218_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName,1,-1);
  end
end

--**********************************
--����������
--**********************************
function x210218_CheckAccept( sceneId, selfId )
	--��Ҫ8�����ܽ�
	if GetLevel( sceneId, selfId ) >= 8  then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210218_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210218_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210218_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210218_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x210218_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x210218_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210218_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210218_OnItemChanged( sceneId, selfId, itemdataId )
end
