-- ��������  ����ǹ
-- ��ҵȼ����ڵ���20������ɡ�����ͬ�С����ӳ��Ҷ������������ˡ�


--************************************************************************
--MisDescBegin
--�ű���
x212116_g_ScriptId = 212116

x212116_g_PreMissionId = 921

--MisDescEnd
--************************************************************************

--��������
x212116_g_CopySceneName = "����"

x212116_g_CopySceneType = FUBEN_JUQING	--�������ͣ�������ScriptGlobal.lua����

x212116_g_CopySceneMap = "jishi.nav"
x212116_g_LimitMembers = 1				--���Խ���������С��������
x212116_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x212116_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x212116_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x212116_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x212116_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x212116_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x212116_g_Fuben_X = 40					--���븱����λ��X
x212116_g_Fuben_Z = 44					--���븱����λ��Z
x212116_g_Back_X = 105					--Դ����λ��X
x212116_g_Back_Z = 112					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x212116_OnDefaultEvent( sceneId, selfId, targetId )
	-- �����������Լ��Ƕӳ�������3�ˣ�
	--1������Լ��ǲ����ڶ�����
	if GetTeamSize(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ҫ��������������������һ��������3���˵Ķ����У�������Ķ�Ա�������ٹ���3���ڸ������㻹��Ҫ�Ƕӳ���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNearTeamCount(sceneId,selfId) < 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ҫ��������������������һ��������3���˵Ķ����У�������Ķ�Ա�������ٹ���3���ڸ������㻹��Ҫ�Ƕӳ���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNearTeamCount(sceneId,selfId) < 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ҫ��������������������һ��������3���˵Ķ����У�������Ķ�Ա�������ٹ���3���ڸ������㻹��Ҫ�Ƕӳ���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ҫ��������������������һ��������3���˵Ķ����У�������Ķ�Ա�������ٹ���3���ڸ������㻹��Ҫ�Ƕӳ���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	x212116_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x212116_OnEnumerate( sceneId, selfId, targetId )
	
	-- ���븱������������ҵȼ�����20�������������� 
	if IsHaveMission( sceneId, selfId, x212116_g_PreMissionId ) > 0 then
		AddNumText( sceneId, x212116_g_ScriptId, "����ȥ����", 10 ,-1 )
	end
	
end

--**********************************
--����������
--**********************************
function x212116_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x212116_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x212116_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x212116_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x212116_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "jishi.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x212116_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x212116_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x212116_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x212116_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ��Boss������
	
	-- �����õ��ı������
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	--���ó����еĸ���Npc������
	LuaFnSetSceneLoad_Area( sceneId, "jishiemeimis_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "jishiemeimis_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--�����¼�
--**********************************
function x212116_OnCopySceneReady( sceneId, destsceneId )

	--���븱���Ĺ���
	-- 1���������ļ�û����ӣ��ʹ�������ļ��Լ����븱��
	-- 2, �������ж��飬������Ҳ��Ƕӳ����ʹ����Լ����븱��
	-- 3���������ж��飬�����������Ƕӳ����ʹ����Լ��͸�������һ���ȥ

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	-- �������ǲ����ж���
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- û�ж���
		return
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x212116_g_Fuben_X, x212116_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x212116_g_Fuben_X, x212116_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x212116_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x212116_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x212116_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x212116_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x212116_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x212116_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x212116_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x212116_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x212116_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x212116_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x212116_OnCopySceneTimer( sceneId, nowTime )
	--��⸱���еĹ��ǲ���ɱ�⣬ɱ���Զ�����ҳ�����
	
	
end



