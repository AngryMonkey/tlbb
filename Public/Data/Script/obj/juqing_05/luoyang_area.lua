-- ������Id = 4���¼�����
-- ���ܣ�������������21��ͬʱ��û���������22��ͬʱ��������û�б���������������ʱ��

-- ǰ������
x113007_g_PreMissionId = 21
x113007_g_MissionId = 22

x113007_g_OnTimerIndex = -1

-- ������
x113007_g_GroupId = 1

--**********************************
--���������¼�
--**********************************
function x113007_OnEnterArea( sceneId, selfId, areaId)

	-- ����������ֵ�����	
  if IsMissionHaveDone(sceneId,selfId,x113007_g_PreMissionId) < 1 then
  	return 0
  end
  
  -- �������Ѿ������������񣬾Ͳ���ˢ�Ƿ������
  if IsMissionHaveDone(sceneId,selfId,x113007_g_MissionId) > 0 then
  	return 0
  end
  
  -- ����ͼ���ǲ����Ѿ������������������ǲ�������ҵģ����Է�����
  local nMonsterNum = GetMonsterCount(sceneId)
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "�Ƿ�"  then
			return
		end
		
		if GetName(sceneId, nMonsterId)  == "����"  then
			return
		end
	end

  -- ��������Ƿ壬����
  local nNpc1 = LuaFnCreateMonster(sceneId, 442, 283, 116, 3, 0, 36008)
	local nNpc2 = LuaFnCreateMonster(sceneId, 443, 283, 113, 3, 0, 200025)

	SetCharacterName(sceneId, nNpc1, "�Ƿ�")
	SetCharacterName(sceneId, nNpc2, "����")
	
	-- ������ʧʱ��
	SetCharacterDieTime(sceneId, nNpc1, 600000)
	SetCharacterDieTime(sceneId, nNpc2, 600000)
	
	-- ����һ������
	--local groupId = AllocateMonsterGroup(sceneId)
	
	-- ���ڹ̶���ʹ��һ��������,��ʹ��ǰ����վͿ���
	ReleaseMonsterGroup(sceneId, x113007_g_GroupId)
	
	AddGroupLeader(sceneId, x113007_g_GroupId, nNpc1)
	AddGroupMember(sceneId, x113007_g_GroupId, nNpc2, 2, 1)
	RefixPosOfGroupMember(sceneId,x113007_g_GroupId,nNpc1)

	SetIntervalDistOfGroupMember(sceneId, x113007_g_GroupId, 1)
	
	SetPatrolId(sceneId, nNpc1, 5)
	
end

--**********************************
--���������¼�
--**********************************
function x113007_OnLeaveArea( sceneId, selfId, areaId)

end

