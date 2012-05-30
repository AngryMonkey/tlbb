--������:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]

--�������ܴ��ݻȺ��������ʹ�ýű�


--�ű���
x808088_g_scriptId = 808088

--��Ҫ�ĵȼ�
--��Ҫ������ID
x808088_g_MissionID = 1000

--��Ҫ��Ч��ID	���ʹ��
x808088_g_ImpactID 	= 5929

--Ч����ID	������������ SelfimpactID,��ʹ�� impactId01,����ʹ�� impactId02
x808088_g_itemList = {}
x808088_g_itemList[30505213] = { SelfimpactID=5933, impactId01=0, impactId02=5940 }			-- �����

--������Χ
x808088_g_AttackRange = 5


--**********************************
--�¼��������
--**********************************
function x808088_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x808088_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x808088_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x808088_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	--���ʹ������û�й�����������
	if IsHaveMission( sceneId, selfId, x808088_g_MissionID ) <= 0 then
		x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end
	
	--���ʹ���ߵ���ʹ������
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808088_g_ImpactID) == 0 then
		x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808088_g_itemList[itemTblIndex];
	if not itemCur then
		x808088_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	--���鹥��Ŀ��ʹ������
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 0
	end

	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then				--��������....
		
		-- ����Ƿ���Լ�
		if selfId == targetId then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0
		end
		
		--��ⱻ��������û�й�����������
		if IsHaveMission( sceneId, targetId, x808088_g_MissionID ) <= 0 then
			x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_061}" )
			return 0
		end
		
		--��ⱻ�����ߵ���ʹ������
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, targetId, x808088_g_ImpactID) == 0 then
			x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_061}" )
			return 0
		end
	else

		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
		return 0

	end

	return 1

end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x808088_OnDeplete( sceneId, selfId )
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x808088_OnActivateOnce( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808088_g_itemList[itemTblIndex];
	if not itemCur then
		x808088_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 1
	end
	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--������������....
	
		--ȡ�ñ������ߵĵ�ǰ����	
		local PlayerX = GetHumanWorldX(sceneId,targetId)
		local PlayerY = GetHumanWorldZ(sceneId,targetId)
		
		-- �����������������,�����뱻�����߹�����Χ�ڵ���Ҽ�Impact
		local nPlayerCnt = LuaFnGetCopyScene_HumanCount( sceneId )
		for i=0, nPlayerCnt-1 do
			local OtherPlayerId = LuaFnGetCopyScene_HumanObjId( sceneId, i )
			
			--ȡ�ñ���������Χ������ҵĵ�ǰ����	
			local OtherPlayerX = GetHumanWorldX(sceneId,OtherPlayerId)
			local OtherPlayerY = GetHumanWorldZ(sceneId,OtherPlayerId)
			
			local Distance = floor(sqrt((OtherPlayerX-PlayerX)*(OtherPlayerX-PlayerX)+(OtherPlayerY-PlayerY)*(OtherPlayerY-PlayerY)))
			if Distance < x808088_g_AttackRange then
				
				-- ��ⱻ��������Χ�������Impact
				if IsHaveMission( sceneId, OtherPlayerId, x808088_g_MissionID ) > 0
					 and LuaFnHaveImpactOfSpecificDataIndex(sceneId, OtherPlayerId, x808088_g_ImpactID) ~= 0 then									
					if LuaFnHaveImpactOfSpecificDataIndex(sceneId, OtherPlayerId, itemCur.SelfimpactID) ~= 0 then
						if itemCur.impactId01 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, OtherPlayerId, OtherPlayerId, OtherPlayerId, itemCur.impactId01, 0);
						end
					else
						if itemCur.impactId02 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, OtherPlayerId, OtherPlayerId, OtherPlayerId, itemCur.impactId02, 0);
						end
					end
				end
			end			
		end

	else
    
		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
		return 1
    
	end
    
	return 1;

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x808088_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
-- ��Ŀ��ʾ
--**********************************
function x808088_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
