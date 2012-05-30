--��ɽ BOSSȺˢ�½ű�

--�ű���
x891004_g_ScriptId	= 891004

--ˢ�·�ʽΪ:
--����˽ű�ʱ����ˢ��10��BOSS....

--��Ҫˢ����BOSS�����ݱ�....
--BOSS��MonsterID�����ظ�....�ڳ�����ͬһʱ��ͬһ��MonsterID�Ĺ�ֻ�ܴ���һ��....���˾Ͳ�ˢ��....
x891004_g_BossData = {

	-- ID						BOSS�� monster id
	-- PosX					����
	-- PosY					����
	-- BaseAI				BOSS��BaseAI....
	-- ExtAIScript	BOSS����չAI....
	-- ScriptID			BOSS�Ľű�ID....
	-- NeedCreate		����1....

	{ ID=42219, PosX=200,  PosY=298, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42220, PosX=174,  PosY=249, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42221, PosX=103,  PosY=241, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42222, PosX=63, PosY=254, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42223, PosX=81,  PosY=190, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42224, PosX=131,  PosY=185, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42225, PosX=157,  PosY=136, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42226, PosX=198, PosY=104, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42227, PosX=270,  PosY=92, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42228, PosX=272,  PosY=129, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42229, PosX=273,  PosY=161, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42230, PosX=247, PosY=49, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42231, PosX=208,  PosY=44, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42232, PosX=182,  PosY=84, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42233, PosX=165,  PosY=65, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42234, PosX=128, PosY=85, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42235, PosX=111,  PosY=121, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42236, PosX=96,  PosY=91, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42237, PosX=80,  PosY=70, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42238, PosX=93, PosY=51, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },

}


--**********************************
--�ű���ں���
--**********************************
function x891004_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--�����....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS���ݱ�Ϊ�վͲ�ˢBOSS....
	if getn(x891004_g_BossData) < 1 then
		return
	end

	--����Boss�ؽ�״̬....
	for _, Data in x891004_g_BossData do
		Data.NeedCreate = 1
	end

	--�������������еĹ�....����BOSS�ؽ�״̬....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x891004_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--�ؽ���Ҫ�ؽ���BOSS....
	for _, BossData in x891004_g_BossData do
		if BossData.NeedCreate == 1 then
			local MonsterID = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			SetCharacterTitle(sceneId, MonsterID, "��ɽ��ͽ")
		end
	end

end

--**********************************
--��������
--**********************************
function x891004_OnTimer( sceneId, actId, uTime )

	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--���ڸ����ؽ�״̬....
--**********************************
function x891004_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x891004_g_BossData do
		if DataID == Data.ID then
			x891004_g_BossData[i].NeedCreate = 0
			break
		end
	end

end
