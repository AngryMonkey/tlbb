--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--����
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x050053_g_scriptId = 050053

--buff���б�
x050053_g_Impact = {

		5910,
		5911,
}

x050053_g_strDropNotice ="#{NSBS_20071228_12}"

x050053_g_BianPao1 = 30505165
x050053_g_BianPao2 = 30505166
x050053_g_MosterDataID = 11355
x050053_g_Distance = 16
x050053_g_DropItem = 0


x050053_g_PosTbl = {

	{154,47},	{154,59},
	{148,51},	{160,55},
	{148,55},	{160,51},
}

--������id
x050053_g_GrowPointID = 781
--**********************************
--�¼��������
--**********************************
function x050053_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x050053_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x050053_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x050053_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	return 1;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x050053_OnDeplete( sceneId, selfId )
	--������....��߻�Ҫʹ�ô浽��Ʒ�ϵ���Ϣ��....
	return 1;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x050053_OnActivateOnce( sceneId, selfId )
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end
	
	--�����˺�ֵ
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local damagevale = 2
	
	local impactID = x050053_g_Impact[1]
		
	if x050053_g_BianPao2==itemTblIndex then
		damagevale = 20
		impactID = x050053_g_Impact[2]
		
		--�����ߺ͸�buff
	end
	
	--����Ʒ....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	if x050053_g_BianPao2==itemTblIndex then
		
		local rand = random(100)
			
		
		if rand < 11 then
			
			if rand < 6 then  	--����
				
				local BagIndex = TryRecieveItem( sceneId, selfId, 30501158, QUALITY_MUST_BE_CHANGE )

				if BagIndex ~= -1 then					
					LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4874, 0);
				end
				
			else								--���߽�	
				
				local BagIndex = TryRecieveItem( sceneId, selfId, 30501157, QUALITY_MUST_BE_CHANGE )

				if BagIndex ~= -1 then
					LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4875, 0);
				end	
			end
			
		end
	end
	
	--ֻ����һ�ұ���ʱ��buff....������Ч
	if x050053_g_BianPao2==itemTblIndex then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactID, 0);
	end
	
	--�˺�boss
	--ȡ����ҵ�ǰ����
	local mosterid = -1;
	
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	local MosterX = 0;
	local MosterY = 0;
	local mosterid = -1;
	local IsCreateBox = 0;
	local IsFindMonster = 0;


	--�������������еĹ�....����BOSS�ؽ�״̬....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		mosterid = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, mosterid )
		
		if MosDataID == x050053_g_MosterDataID then
			MosterX = GetMonsterWorldX(sceneId,i)
			MosterY = GetMonsterWorldZ(sceneId,i)
			IsFindMonster = 1
			IsCreateBox = x050053_IsCreateSixBox(sceneId,i,damagevale)
			break;
		end
	end

	
	local Distance = floor(sqrt((MosterX-PlayerX)*(MosterX-PlayerX)+(MosterY-PlayerY)*(MosterY-PlayerY)))
	
	if Distance < x050053_g_Distance and IsFindMonster == 1 then	--boss��Ѫ
		LuaFnSetDamage(sceneId, selfId, mosterid, damagevale)
		
		if IsCreateBox ==1 then 
			x050053_CreateSixBox(sceneId, selfId)
		end
	end
	return 1;
end

function x050053_ClearDromItemFlag( sceneId )
	x050053_g_DropItem = 0;
end

function x050053_IsCreateSixBox( sceneId, index, damagevale)

		local HP = GetMonsterHP(sceneId,index)
		local MaxHP = GetMonsterMaxHP(sceneId,index)
		
		local HP3 = MaxHP*3/4
		local HP2 = MaxHP*2/4
		local HP1 = MaxHP*1/4
		
		if HP >= HP3 and HP-damagevale < HP3 and x050053_g_DropItem == 0 then
			x050053_g_DropItem =1
			return 1
		elseif HP >= HP2 and (HP-damagevale) < HP2 and x050053_g_DropItem == 1 then
			x050053_g_DropItem =2
			return 1
		elseif HP >= HP1 and (HP-damagevale) < HP1 and x050053_g_DropItem == 2 then
			x050053_g_DropItem =3
			return 1
		end
		
		return 0;
end

function x050053_CreateSixBox( sceneId, selfId)

	--���乫��
	BroadMsgByChatPipe( sceneId, selfId, x050053_g_strDropNotice, 4 )
	
	--��������
	for _, Pos in x050053_g_PosTbl do
		
		local ItemBoxId = ItemBoxEnterScene( Pos[1], Pos[2], x050053_g_GrowPointID, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30501157 )
	
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501158)	
		
		local rand = random(100)
		if rand < 26 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30505107)
		end
	
		rand = random(100)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501159)
		end
	
		rand = random(100)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501160)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141105)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141106)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141107)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141108)
		end
	
		rand = random(1000)
		if rand < 7 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141109)
		end
		
		rand = random(1000)
		if rand < 7 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141110)
		end
		
		SetItemBoxMaxGrowTime( sceneId, ItemBoxId, 5400000 )
	end
end
--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x050053_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
