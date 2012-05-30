--200030
--������ Ү��Ī��İ����£�����ҹ��Ĳ�ãɽ

--************************************************************************
--MisDescBegin
--�ű���
x200030_g_ScriptId = 200030

--MisDescEnd
--************************************************************************

--��������
x200030_g_CopySceneName = "��ãɽ"

x200030_g_CopySceneType = FUBEN_JUQING_CANGMANGSHAN	--�������ͣ�������ScriptGlobal.lua����

x200030_g_CopySceneMap = "cangmang_1.nav"
x200030_g_Exit = "cangmang_1.ini"
x200030_g_LimitMembers = 1				--���Խ���������С��������
x200030_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x200030_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x200030_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x200030_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x200030_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x200030_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x200030_g_Fuben_X = 102					--���븱����λ��X
x200030_g_Fuben_Z = 19					--���븱����λ��Z
x200030_g_Back_X = 66					--Դ����λ��X
x200030_g_Back_Z = 56					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x200030_OnDefaultEvent( sceneId, selfId, targetId )
	-- ������ҵ������������͵���ͬ�ĸ���
	x200030_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x200030_OnEnumerate( sceneId, selfId, targetId )
	
	--����ܹ�����ҹ��ĸ�����ǰ������
	-- 0,�������Ѿ��ӵ���29�����������29���Ͳ����ٽ����������
	if IsHaveMission( sceneId, selfId, 29 ) > 0 then
		return 0
	end
	if IsMissionHaveDone(sceneId, selfId, 29) > 0   then
		return 0
	end

	-- 1��ӵ�������Ϊ26������
	if IsHaveMission( sceneId, selfId, 26 ) > 0 then
		AddNumText( sceneId, x200030_g_ScriptId, "����ȥ��ãɽ(ҹ��)", 10 ,-1 )
		return 0
	end

	-- 2,ֻҪ�����27���񣬾��ܽ���
	if IsHaveMission( sceneId, selfId, 27 ) > 0 then
		AddNumText( sceneId, x200030_g_ScriptId, "����ȥ��ãɽ(ҹ��)", 10 ,-1 )
		return 0
	end
	
	-- 3,�����������26��û��27��Ҳ�ܽ���
	if IsMissionHaveDone(sceneId, selfId, 26) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 27) < 1   then
			if IsHaveMission( sceneId, selfId, 27 ) < 1 then
				AddNumText( sceneId, x200030_g_ScriptId, "����ȥ��ãɽ(ҹ��)", 10 ,-1  )
				return 0
			end
		end
	end

	-- 3,�����������26��û��28��Ҳ�ܽ���
	if IsMissionHaveDone(sceneId, selfId, 26) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 28) < 1   then
			if IsHaveMission( sceneId, selfId, 28 ) < 1 then
				AddNumText( sceneId, x200030_g_ScriptId, "����ȥ��ãɽ(ҹ��)", 10 ,-1  )
				return 0
			end
		end
	end
	
end

--**********************************
--����������
--**********************************
function x200030_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x200030_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200030_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x200030_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x200030_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "cangmang_1.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200030_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200030_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200030_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200030_g_ScriptId);--��1����������Ϊ���������¼��ű���
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
	LuaFnSetSceneLoad_Area( sceneId, "cangmang_1_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangmang_1_monster.ini" )

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
function x200030_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200030_g_Fuben_X, x200030_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200030_g_Fuben_X, x200030_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x200030_g_Fuben_X, x200030_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x200030_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x200030_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x200030_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x200030_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200030_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200030_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200030_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200030_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200030_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200030_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x200030_OnCopySceneTimer( sceneId, nowTime )
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--����˵��
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) ;--����˵����
	
	local selfId = LuaFnGetCopySceneData_Param(sceneId, 20)
	
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9);--ʱ��
	
	-- ��һ�εĶ԰� ��ʱ������� ��������ʱ�򴥷�
	if nStep1==1 then
		--PrintNum(10)
		if nStep2==0 then
			-- ���� paopao
			CallScriptFunction((200060), "Paopao",sceneId, "����", "��ãɽ", "#{JQ_PaoPao_83}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end
			
		elseif nStep2==2 then
			-- ���� paopao
			CallScriptFunction((200060), "Paopao",sceneId, "Ү�ɺ��", "��ãɽ", "#{JQ_PaoPao_84}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==3 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			end
			
		elseif nStep2==4 then
			-- ���� paopao
			CallScriptFunction((200060), "Paopao",sceneId, "Ү�ɺ��", "��ãɽ", "#{JQ_PaoPao_85}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		end
	end
end

