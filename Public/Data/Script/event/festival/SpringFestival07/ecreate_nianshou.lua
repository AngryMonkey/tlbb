--����ɽ ����BOSSȺˢ�½ű�

--�ű���
x050050_g_ScriptId	= 050050

--�޵�buffid����ȱ��?????
x050050_g_Wudibuff = 10489

--ˢ�·�ʽΪ:
--����˽ű�ʱ����ˢ��10��BOSS....

--��Ҫˢ����BOSS�����ݱ�....
--BOSS��MonsterID�����ظ�....�ڳ�����ͬһʱ��ͬһ��MonsterID�Ĺ�ֻ�ܴ���һ��....���˾Ͳ�ˢ��....
x050050_g_BossData = {

	-- ID						BOSS�� monster id
	-- PosX					����
	-- PosY					����
	-- BaseAI				BOSS��BaseAI....
	-- ExtAIScript	BOSS����չAI....
	-- ScriptID			BOSS�Ľű�ID....
	-- NeedCreate		����1....

	{ ID=11355, PosX=154,  PosY=53, BaseAI=0, ExtAIScript=260, ScriptID=050051, NeedCreate=1 },
}

--�ʱ��
x050050_g_StartDayTime = 8030   --�����ʱ�� 2008-1-31
x050050_g_EndDayTime = 8044   --�����ʱ�� 2008-2-14

--**********************************
--�ű���ں���
--**********************************
function x050050_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	--���ʱ��
	local isTime = x050050_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	--�����....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS���ݱ�Ϊ�վͲ�ˢBOSS....
	if getn(x050050_g_BossData) < 1 then
		return
	end

	CallScriptFunction( 050053, "ClearDromItemFlag", sceneId)

	--����Boss�ؽ�״̬....
	for _, Data in x050050_g_BossData do
		Data.NeedCreate = 1
	end

	--�������������еĹ�....����BOSS�ؽ�״̬....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x050050_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--�ؽ���Ҫ�ؽ���BOSS....
	for _, BossData in x050050_g_BossData do
		if BossData.NeedCreate == 1 then
			local npcobjid = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			LuaFnSendSpecificImpactToUnit(sceneId, npcobjid, npcobjid, npcobjid, x050050_g_Wudibuff, 0 )
		end
	end

end

--**********************************
--��������
--**********************************
function x050050_OnTimer( sceneId, actId, uTime )

	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--���ڸ����ؽ�״̬....
--**********************************
function x050050_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x050050_g_BossData do
		if DataID == Data.ID then
			x050050_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

--**********************************
--����Ƿ��ѽ���
--**********************************
function x050050_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050050_g_StartDayTime and curDayTime <= x050050_g_EndDayTime then
		return 1
	else
		return 1
	end

end
