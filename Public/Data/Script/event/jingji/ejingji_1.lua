-- 125020
-- ���뾺�����Ŀ���
-- ���ű���Ҫserver����������� "-loadscriptonce" ������������

--
x125020_g_ScriptId = 125020

x125020_g_Position = {
				{id=1,scene=0,x=143,z=151},
				{id=2,scene=1,x=28, z=152},
				{id=3,scene=2,x=149,z=80},
				{id=4,scene=3,x=36, z=49},
				{id=5,scene=420,x=33, z=49},
}

-- 4��buff����λ��
x125020_g_BuffPosition = {
				{id=1,x=81, z=53, preTime=0},
				{id=2,x=81, z=146,preTime=0},
				{id=3,x=33, z=99, preTime=0},
				{id=4,x=130,z=99, preTime=0},
				{id=5,x=107,z=74, preTime=0},
				{id=6,x=106,z=124, preTime=0},
				{id=7,x=56 ,z=124, preTime=0},
				{id=8,x=56 ,z=73, preTime=0},
				
}

-- С����������б�
x125020_g_SmallBoxName = {
				"��ɫ����",
				"��ɫ����",
				"��ɫ����",
				"��ɫ����",
				"��ɫ����",
				"��ɫ����",
				"��ɫ����",
}

-- С���俪������buff�б�
x125020_g_SmallBoxList = {
				{id=1,monId=5004,script=125023,},
				{id=2,monId=5005,script=125023,},
				{id=3,monId=5006,script=125023,},
				{id=4,monId=5007,script=125023,},
				{id=5,monId=5008,script=125023,},
				{id=6,monId=5009,script=125023,},
				{id=7,monId=5010,script=125023,},
}

-- ��Ƭ����λ��
x125020_g_StonePosition_1 = {
				{tp=1,x=45,z=65},{tp=1,x=42,z=67},{tp=1,x=47,z=63},
				{tp=1,x=52,z=87},{tp=1,x=63,z=84},{tp=1,x=71,z=78},
				{tp=1,x=68,z=69},{tp=1,x=62,z=64},{tp=1,x=51,z=66},
				{tp=1,x=71,z=74},}

x125020_g_StonePosition_2 = {
				{tp=2,x=92 ,z=65},{tp=2,x=96 ,z=70},{tp=2,x=94 ,z=76},
				{tp=2,x=95 ,z=80},{tp=2,x=104,z=64},{tp=2,x=102,z=84},
				{tp=2,x=108,z=85},{tp=2,x=114,z=81},{tp=2,x=102,z=74},
				{tp=2,x=119,z=67},}
				
x125020_g_StonePosition_3 = {
				{tp=3,x=44,z=106},{tp=3,x=45,z=111},{tp=3,x=43,z=123},
				{tp=3,x=46,z=131},{tp=3,x=44,z=136},{tp=3,x=56,z=133},
				{tp=3,x=61,z=136},{tp=3,x=70,z=136},{tp=3,x=67,z=127},
				{tp=3,x=61,z=115},}

x125020_g_StonePosition_4 = {
				{tp=4,x=87, z=114},{tp=4,x=92, z=115},{tp=4,x=93, z=131},
				{tp=4,x=98, z=136},{tp=4,x=105,z=134},{tp=4,x=114,z=136},
				{tp=4,x=116,z=128},{tp=4,x=120,z=116},{tp=4,x=111,z=113},
				{tp=4,x=120,z=136},}
				
x125020_g_StonePosition_5 = {
				{tp=5,x=147,z=135},{tp=5,x=152,z=124},{tp=5,x=151,z=110},
				{tp=5,x=146,z=100},{tp=5,x=151,z=88},{tp=5,x=133,z=67},
				{tp=5,x=128,z=54},{tp=5,x=110,z=47},{tp=5,x=78,z=39},
				{tp=5,x=59,z=45},}


-- ��һ�α���ˢ�µ�ʱ��
x125020_g_PreCreateBoxTime = -10

-- ����ǰһ���ӵĹ����Ƿ��Ѿ�����
x125020_g_IsPreBroad = 0

-- 
x125020_g_Step = 0

-- ���ʹ���ǰһ���ӵĹ����ʱ��
x125020_g_PreBroadTime = 0

-- ����λ��
x125020_g_BigBoxPosition = {x=81,z=99}

x125020_g_OutPosition = {scene=0,x=160,z=106}

x125020_g_CampList = {}

-- ͬһ��Ӫ���������
x125020_g_SameCampMax = 10

-- ���ͱ���buff��Id
x125020_g_GotoProtect  = 54

-- ��һ��ˢС�����ʱ��
x125020_g_PreCreateSmallBoxTime = 0

-- ������Ϣ
x125020_g_BigBoxInfo = {id=5003,x=82,z=100,ai=3,aif=0,script=125022}

-- ʯͷ������Ϣ
x125020_g_StoneBoxInfo = {id=5002,ai=3,aif=0,script=125024}

-- ��Ʊ��ź�����buff
x125020_g_Yinpiao = 40002000
x125020_g_CaoyunMisId = 4021

x125020_g_PreCreateStoneBox = 0

function x125020_OnInitScene(sceneId, selfId)
	for i=1, 500  do
		x125020_g_CampList[i] = 0
	end
end

--**********************************
--�о��¼�
--**********************************
function x125020_OnEnumerate( sceneId, selfId, targetId )	
   AddNumText( sceneId, x125020_g_ScriptId, "���뾺����", 9, 1 )        
   AddNumText( sceneId, x125020_g_ScriptId, "ʲô�Ƿ���̨����", 11, 2 )        
end

--**********************************
--������ں���
--**********************************
function x125020_OnDefaultEvent( sceneId, selfId, targetId )
	-- �ɽ����ͼ�ȼ���35��
	-- ����ʱ�䣺24Сʱ���ţ����������ʱ����μ�ս����ֻ�ǲ�һ���б�����Կ���
	-- ��������߲��ɽ��룺��Ʊ�������̡���Ʊ�İ�����ˡ����������������ߡ����������ȡ�
	-- ������һ֧�����в��ܽ��롣
	
	if GetNumText() == 2  then
    BeginEvent(sceneId)
      AddText(sceneId,"#Bʲô�Ƿ���̨����");
      AddText(sceneId,"#{JINGJI_INFO}");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
	end

  -- 0������˫�����״̬���ˣ����ܱ���
  if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B������");
      AddText(sceneId,"  ˫�����״̬�£����ܽ��뾺������");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
  end

  -- 1,����ȼ�����35
  if GetLevel(sceneId, selfId) < 35  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B������");
      AddText(sceneId,"  ���뾺��������Ҫ35�����ϲ��ܲμӣ�������Ϊ���������ȵ�35��֮���������Ұɡ�");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
  end
  
  -- 2����Ӳ��ܽ���
  if LuaFnHasTeam( sceneId, selfId ) == 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B������");
      AddText(sceneId,"  ���뾺������Ҫ��һ��������ͷ��");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
	end

	-- ����״̬���ܽ�������
	if GetItemCount(sceneId, selfId, x125020_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  �����������ڴ����ܵ����Ƶ�״̬�����ܽ�����ɽ����̨��" )
		EndEvent( sceneId )
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- ��Ҵ�������״̬���ܽ��볡��
	if IsHaveMission(sceneId,selfId, x125020_g_CaoyunMisId) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  �����������ڴ����ܵ����Ƶ�״̬�����ܽ�����ɽ����̨��" )
		EndEvent( sceneId )
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- �����ϣ�����
	local nPos_X = 0
	local nPos_Z = 0
	for i, pos in x125020_g_Position  do
		if pos.scene == sceneId   then
			nPos_X = pos.x
			nPos_Z = pos.z
		end
	end
	local nJingjiScnenId = 414
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nJingjiScnenId, nPos_X, nPos_Z)
	
end

--**********************************
-- ��ҽ���
--**********************************
function x125020_OnScenePlayerEnter(sceneId, selfId)
	
--	-- 0��������û�ж��飬������뿪
--	if LuaFnHasTeam(sceneId, selfId) == 0  then
--		-- ȡ������������ƴ��͵��޵�buff����ܴ���
--		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x125020_g_GotoProtect) == 1   then
--			LuaFnCancelSpecificImpact(sceneId, selfId, x125020_g_GotoProtect)
--		end
--		
--		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 
--					x125020_g_OutPosition.scene, x125020_g_OutPosition.x, x125020_g_OutPosition.z)
--		return
--	end

	-- 1����鳡���ں��Լ���Ӫ��ͬ����ҵ�����
	local nTeamId = GetTeamId(sceneId, selfId)
	local nCampID = nTeamId + 500
	if x125020_GetSameCampCount(sceneId, nCampID) >= x125020_g_SameCampMax  then
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x125020_g_GotoProtect) == 1   then
			LuaFnCancelSpecificImpact(sceneId, selfId, x125020_g_GotoProtect)
		end

		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 
					x125020_g_OutPosition.scene, x125020_g_OutPosition.x, x125020_g_OutPosition.z)
		return
	end
	
	-- ��û�ж������ң��������ʱ��Ӫ	
	
	
	-- �����ҿ�����������
	if LuaFnHasTeam(sceneId, selfId) == 1  then	
		SetUnitCampID(sceneId, selfId, selfId, nCampID)
		
	-- û�ж������ң��͸�һ����������
	else
		local tempCamp = random(449) + 50
		SetUnitCampID(sceneId, selfId, selfId, tempCamp)
	end
	
	-- end�����������¼�
	local x,z = LuaFnGetWorldPos(sceneId, selfId)
	local v = x125020_g_Position
	if x~=v[1].x or z~=v[1].z  and
		 x~=v[2].x or z~=v[2].z  and
		 x~=v[3].x or z~=v[3].z  and
		 x~=v[4].x or z~=v[4].z  and
		 x~=v[5].x or z~=v[5].z  then
			
			x = v[1].x
			z = v[1].z
	end
	
	SetPlayerDefaultReliveInfoEx( sceneId, selfId, "%100", "%100", "0", sceneId, x, z, 125020 )
end

--**********************************
-- x125020_OnRelive
--**********************************
function x125020_OnRelive(sceneId, selfId)
	-- ��������һ��buff BUFF�������ھ��������㲻���ܵ������˺���
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, 
										selfId, 8054, 100 )
end

--**********************************
-- OnTime
--**********************************
function x125020_OnSceneTimer(sceneId)
	
	-- 1,����������ӪС��10���ˣ�
	x125020_DealNoCampHuman(sceneId)
	
	-- 2,����ķϻ�
	x125020_RandomBroad(sceneId)
	
	-- 2������ˢ��
	local nCurTime = GetHour()
	-- ����ˢ��������
	-- a����Ҫ��˫�����㣬
	local nMinute = GetMinute()
	
	if (nCurTime==0 or nCurTime==10 or
		 nCurTime==12 or nCurTime==14 or nCurTime==16 or
		 nCurTime==18 or nCurTime==20 or nCurTime==22)   then
		 
		if (nCurTime-x125020_g_PreCreateBoxTime >= 2 or x125020_g_PreCreateBoxTime-nCurTime>=2) and
			 x125020_g_Step == 0  and 
			 nMinute >= 45 and nMinute < 50    then	
			-- �ȷ�һ����ʾ���棬һ���Ӻ���ˢ������
			x125020_PreBroad(sceneId)
			x125020_g_PreBroadTime = LuaFnGetCurrentTime()
			x125020_g_IsPreBroad = 0
			x125020_g_Step = 1
		end

		if x125020_g_Step == 1 and LuaFnGetCurrentTime()-x125020_g_PreBroadTime >= 60  then
			x125020_g_PreCreateBoxTime = nCurTime
			x125020_CreateBigBox(sceneId)
			x125020_g_Step = 0
		end
	end
	
	if (nMinute==5 or nMinute==25) and x125020_g_PreCreateStoneBox ~= nMinute  then
		x125020_CreateStoneBox(sceneId)
		x125020_g_PreCreateStoneBox = nMinute
	end
	
	local nNowTime = LuaFnGetCurrentTime()
	if nNowTime-x125020_g_PreCreateSmallBoxTime >= 30  then
		x125020_CreateSmallBox(sceneId)
		x125020_g_PreCreateSmallBoxTime = nNowTime
	end

end

--**********************************
-- ��������ǰһ���ӵĹ���
--**********************************
function x125020_PreBroad(sceneId)
	local str = "#Y�ھ���#P�󺰣�����Ӣ���ǣ�һ����֮��װ������;���ı���ͽ����ڷ���̨����Ҫ������������Ӣ���ǣ��������ðɣ����ҵ�#G������155��107���ĺ��ʣ����ݣ�186��129��������������177��133���׳���#P���������̨����������������������"
	BroadMsgByChatPipe(sceneId, 0, str, 4)
end

--**********************************
-- �ڳ����д�����һ��С����
--**********************************
function x125020_CreateSmallBox(sceneId)
	-- ��ɾ�����е�С����
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		for j=1, getn(x125020_g_SmallBoxName)  do
			if szName == x125020_g_SmallBoxName[j]  then
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
		end
	end
	
	-- ���������8������
	for i=1, getn(x125020_g_BuffPosition)  do
		local nRand = random(getn(x125020_g_SmallBoxList))
		local nBoxId = LuaFnCreateMonster(sceneId, x125020_g_SmallBoxList[nRand].monId,
																x125020_g_BuffPosition[i].x,
																x125020_g_BuffPosition[i].z,
																3,
																0,
																x125020_g_SmallBoxList[nRand].script)
		
		SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	end
	
end

--**********************************
-- �ڳ����д�����һ������
--**********************************
function x125020_CreateBigBox(sceneId)

	-- ����ϵͳ����(�����Ƿ����ʱ����Ҫ�������䣬������涼��һ��Ҫ����)
	local str = "#Y�ھ���#P�󺰣�����Ӣ���ǣ�װ������;���ı����Ѿ����ڷ���̨����Ҫ������������Ӣ���ǣ��������ðɣ����ҵ�#G�����ĺ���(155��107)������������(186��129)������׳���(177��133)#P���������̨����������������������"
	BroadMsgByChatPipe(sceneId, 0, str, 4)
	
	-- ��Ҫ��ⳡ�����ǲ��ǻ������monster ����У��Ͳ��ٴ���
	local nCount = GetMonsterCount(sceneId)
	local bHaveBox = 0
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, nObjId) == "����"  then
			bHaveBox = 1
		end
	end
	
	if bHaveBox == 1  then
		return
	end
	
	-- ����һ���ر�� monster 
	local v = x125020_g_BigBoxInfo
	local nBoxId = LuaFnCreateMonster(sceneId, v.id, v.x, v.z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
end

--**********************************
-- �ڳ����д�����ʯͷ����
--**********************************
function x125020_CreateStoneBox(sceneId)

	-- ��ɾ����ǰ�е�����
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		if szName == "��ɫ����"  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end

	-- ��  x125020_g_StonePosition_1 
	local v = x125020_g_StoneBoxInfo 
	
	local nRand = random(getn(x125020_g_StonePosition_1))
	local x = x125020_g_StonePosition_1[nRand].x
	local z = x125020_g_StonePosition_1[nRand].z
	local nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_2))
	x = x125020_g_StonePosition_2[nRand].x
	z = x125020_g_StonePosition_2[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_3))
	x = x125020_g_StonePosition_3[nRand].x
	z = x125020_g_StonePosition_3[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_4))
	x = x125020_g_StonePosition_4[nRand].x
	z = x125020_g_StonePosition_4[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_5))
	x = x125020_g_StonePosition_5[nRand].x
	z = x125020_g_StonePosition_5[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	--PrintNum(1)
	
end

--**********************************
-- ��ó�����һ����ӪĿǰ������
--**********************************
function x125020_GetSameCampCount(sceneId, CampId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local nCount = 0
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if CampId == GetUnitCampID(sceneId, nHumanId, nHumanId)   then
			nCount = nCount+1
		end
	end

	return nCount
end

--**********************************
-- ��������û����Ӫ����
--**********************************
function x125020_DealNoCampHuman(sceneId)
	
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) < 500   then
			-- ��ö�����Ϣ
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
				if LuaFnHasTeam(sceneId, nHumanId) == 1  then
					local nTeamId = GetTeamId(sceneId, nHumanId)
					local nCampId = nTeamId + 500 
					if x125020_GetSameCampCount(sceneId, nCampId) >= 10  then
						if LuaFnHaveImpactOfSpecificDataIndex(sceneId, nHumanId, x125020_g_GotoProtect) == 1   then
							LuaFnCancelSpecificImpact(sceneId, nHumanId, x125020_g_GotoProtect)
						end
			
						CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 
									x125020_g_OutPosition.scene, x125020_g_OutPosition.x, x125020_g_OutPosition.z)
						return
					else
						SetUnitCampID(sceneId, nHumanId, nHumanId, nCampId)
					end
				end
			end
		end
	end	
	
end	

--**********************************
-- �������
--**********************************
function x125020_RandomBroad(sceneId)
	if random(100) == 1  then
		local rand = random(3)
		local str
		if rand == 1  then
			str = "#G[����̨]#Y�ھ���#P�󺰣�Ӣ���ǣ��ó����ǵ���ʵ����ɣ�"
		elseif rand == 2  then
			str = "#G[����̨]#Y�ھ���#P�󺰣����ͣ���Ȼ�����Ҫ�����������ˣ�"
		elseif rand == 3  then
			str = "#G[����̨]#Y�ھ���#P�󺰣�ս���ɣ�Ϊ����λ��ҲΪ�˽�����"
		end

		CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	end
end

--**********************************
-- ������ڳ���������
--**********************************
function x125020_OnSceneHumanDie( sceneId, selfId, killerId )
	-- ���������ϵ� "��Ƭ����"��ͳͳɾ��
	local nStoneId = 40004434
	local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
	
	if nStoneCount >= 1  then
		local ret = DelItem(sceneId, selfId, nStoneId, 1)
		
		-- �ڵ������ɵ����������Ƭ�Ž�ȥ����ֹ����ˢ��ֻ�гɹ�ɾ�����Ŵ�������
		if ret > 0   then
			local x
			local z
			x,z = GetWorldPos(sceneId, selfId)
			
			-- �������ɹ������һ�������
			local nBoxId = DropBoxEnterScene(	x,z,sceneId )
			AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS, 1, nStoneId)
		end
		
	end
	
end
