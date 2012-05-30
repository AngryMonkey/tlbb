
-- �����ˣ�		����΢
-- ����ʱ�䣺	2008.6.3
-- ����������	��Ʒװ���ų��������ӹ���ÿʮ����ˢ��˪ӰBOSS

-- scriptID = 808040

-- PrintStr("808040")

-- �ű�ID
x808040_g_ScriptId	= 808040


-- ��Ҫˢ����˪ӰBOSS�����ݱ�....
-- ���ӹ��������ˢ�£�ÿ��10����ˢ��1ֻ��ˢ�µ㹲��4�� ҪBOSS�����Ż�ˢ�£����Ų�ˢ��
-- ��������Ϊ����1��31��38������2��32��256������3��279��119������4��31��145��
x808040_g_BossData = {

	-- ID						BOSS�� monster id
	-- PosX					����
	-- PosY					����
	-- BaseAI				BOSS��BaseAI....
	-- ExtAIScript	BOSS����չAI....
	-- ScriptID			BOSS�Ľű�ID....

	{ ID=11392, PosX=31,  PosY=38, BaseAI=0, ExtAIScript=0, ScriptID=0 },
	{ ID=11392, PosX=32,  PosY=256, BaseAI=0, ExtAIScript=0, ScriptID=0 },
	{ ID=11392, PosX=279,  PosY=119, BaseAI=0, ExtAIScript=0, ScriptID=0 },
	{ ID=11392, PosX=31,  PosY=145, BaseAI=0, ExtAIScript=0, ScriptID=0 },
}

-- ����ID�����ӹ���ĳ���IDΪ420
x808040_g_SceneID = 420	
	



--**********************************
--�ű���ں���
--**********************************
function x808040_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--PrintStr("x808040_OnDefaultEvent")
	
	--�����.... ���ʮ���ӣ����Ե���20�뼴�ɡ� ʮ���ӣ�600*1000
	StartOneActivity( sceneId, actId, 600*1000, iNoticeType )
	
end

--**********************************
--��������
--**********************************
function x808040_OnTimer( sceneId, actId, uTime )

	--PrintStr("x808040_OnTimer")
	
	local currHour = GetHour()
	--PrintStr("x808040_OnTimer::currHour:"..currHour)
	-- 0�㵽2��ˢ��
	if currHour >= 0 and currHour < 2 then
		-- ���������û��˪ӰBOSS����ˢ��һ������
		x808040_CreateABoss()
	end
	-- 10�㵽24��ˢ��
	if currHour >= 10 and currHour < 24 then
		-- ���������û��˪ӰBOSS����ˢ��һ������
		x808040_CreateABoss()
	end


	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

function x808040_CreateABoss()

	--�������������еĹ�....����BOSS�ؽ�״̬....
	local NeedCreate = 1
	local nMonsterNum = GetMonsterCount(x808040_g_SceneID)
	
	--PrintStr("nMonsterNum:"..nMonsterNum)
	
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(x808040_g_SceneID,i)
		local MosDataID = GetMonsterDataID( x808040_g_SceneID, MonsterId )
		if MosDataID == 11392 then
			-- ����΢��2008.6.26���������ڴ��ڶ������ʱ ��ˢ�³�����˪ӰBOSS���������л��б�˪ӰIDֵ����Ĺ֣���
			NeedCreate = 0
			break
		else
			NeedCreate = 1
		end
	end

	-- PrintStr("NeedCreate:"..NeedCreate)
	
	-- ������û��˪ӰBOSS����ˢ��һ����
	if NeedCreate == 1 then 
	
		local BossData = x808040_g_BossData[1]
		
		-- ���ˢ�ֵ�λ�ã���4����
		local rand = random(4)
		--PrintStr("Create Boss Pos:"..rand)

		if rand == 1 then
			BossData			= x808040_g_BossData[1]
		elseif rand == 2 then
			BossData			= x808040_g_BossData[2]
		elseif rand == 3 then
			BossData			= x808040_g_BossData[3]
		else
			BossData			= x808040_g_BossData[4]
		end
		
		-- ˢ��˪ӰBOSS
		LuaFnCreateMonster(x808040_g_SceneID, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
	end
end

-- ͳ������˪ӰBOSS...
function x808040_OnPlayerPickUpItemFromShangyingBoss( sceneId, selfId, itemId, bagidx )
	-- PrintStr("OnPlayerPickUpItemFromShangyingBoss")
	if itemId == 20310101 or itemId == 20310102 then
		AuditJipinZhuangbei(sceneId, selfId, itemId)
	end
end

function x808040_IsNeedMonster()

	--�������������еĹ�....����BOSS�ؽ�״̬....
	local NeedCreate = 0
	local nMonsterNum = GetMonsterCount(x808040_g_SceneID)
	
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(x808040_g_SceneID,i)
		local MosDataID = GetMonsterDataID( x808040_g_SceneID, MonsterId )
		if MosDataID == 11392 then
			-- ����΢��2008.6.26���������ڴ��ڶ������ʱ ��ˢ�³�����˪ӰBOSS���������л��б�˪ӰIDֵ����Ĺ֣���
			NeedCreate = 0
			break
		else
			NeedCreate = 1
		end
	end
	--PrintStr("NeedCreate:"..NeedCreate)
	return NeedCreate
	
end

function x808040_TestMonster()
	if x808040_IsNeedMonster() == 0 then
		PrintStr("Have a Monster in the scene")
	else
		PrintStr("There is no Monster in the scene")
	end
end


--x808040_TestMonster()
--x808040_OnDefaultEvent(420, 166, 0, 0, 0, 0, 0)
--x808040_IsHaveMonster()
--x808040_CreateABoss()
