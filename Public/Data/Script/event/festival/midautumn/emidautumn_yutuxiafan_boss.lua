--�����·���������boss�ű��ű�

--�ű���
x050058_g_ScriptId	= 050058

--��Ҫˢ��������boss����
x050058_g_BossData = {
	-- ID						BOSS�� monster id
	-- AIType				BOSS��AIType....
	-- AIScriptID	BOSS��AIScriptID....
	ID = 890, AIType = 0, AIScriptID = 210, scriptID = 050058, name = "��������"
}

x050058_g_begintime = 20080914      --���ʼʱ��
x050058_g_endtime = 20080928        --�����ʱ��

--ˢ�����õ��������
x050058_g_BossPosData = {   
  --posX ������X���� 
  --posY ������Y���� 
  	{posX = 238, posZ = 63},
  	{posX = 193, posZ = 74},
 	{posX = 150, posZ = 74},
  	{posX = 127, posZ = 91},
  	{posX = 48, posZ = 65},
  	{posX = 177, posZ = 100},
}

x050058_gBossPosNum = 6          --�������Ӧ���������ĸ���
x050058_g_activity_id = 183        --���id����ActivityNotice.txt��id�Ŷ�Ӧ�������Ҹ�

--���ò��������boss״��:0��ʾboss�����أ����ù�����0---31֮�䣬��ʾ�Ѿ�����boss�����ڼ�������30����ʱ����һ����32��ʾʱ�䵽�ˣ��ֹ֣��ֹֺ�0λ
x050058_g_activityParam_bossstate = 0

--**********************************
--�ű���ں���
--**********************************
function x050058_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	if x050058_IsActivityOpen(sceneId) ~= 1 then
		return
	end
	--����˵��������ID���ID��ʱ�������������ͣ����Բ�����Ĭ����ͨ�������ͣ�,�������һ���ӽ���һ������
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )
	--��һ����
	SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 0)
	x050058_SetBossInRandomPos(sceneId)
	
end

--**********************************
--��������
--**********************************
function x050058_OnTimer( sceneId, actId, uTime )

	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end
	
	if x050058_IsActivityOpen(sceneId) ~= 1 then
		return
	end

	local nBossState = GetActivityParam(sceneId, actId, x050058_g_activityParam_bossstate)
	
	if nBossState > 0 and nBossState < 32 then
		nBossState = nBossState + 1
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, nBossState)
	elseif nBossState >= 32 then
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 0)
		x050058_SetBossInRandomPos(sceneId)
	end
end


--**********************************
--������ɱ�˹�
--**********************************
function x050058_OnDie(sceneId, selfId, killerId)						-- ����ID, ��ɱ��ObjId, ɱ��ObjId
	local szName = GetName(sceneId, selfId)
	if szName == x050058_g_BossData.name then
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 1)        --��һ��boss����
	end
end

--�ڸ����������һ������boss
function x050058_SetBossInRandomPos(sceneId)
	local objId
	local nPosRand = random( x050058_gBossPosNum )
	objId = LuaFnCreateMonster( sceneId, x050058_g_BossData.ID, x050058_g_BossPosData[nPosRand].posX, x050058_g_BossPosData[nPosRand].posZ, x050058_g_BossData.AIType, x050058_g_BossData.AIScriptID , x050058_g_BossData.scriptID )
end

--�ж��Ƿ�ʱ�� 2008-08-14--------2008-08-28
--����ֵ��
--0�����ǻʱ��
--1���ǻʱ��
function x050058_IsActivityOpen(sceneId)
	local nDay = GetTime2Day(sceneId)
	local bRet = 0
	
	if nDay >= x050058_g_begintime and nDay <= x050058_g_endtime then
		bRet = 1
	else 
		bRet = 0
	end
	
	return bRet	
end
