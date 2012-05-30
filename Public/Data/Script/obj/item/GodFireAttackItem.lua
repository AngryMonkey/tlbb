--������:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]

--�������ܻ��������ʹ�ýű�


--�ű���
x808087_g_scriptId = 808087

--��Ҫ�ĵȼ�
--��Ҫ������ID
x808087_g_MissionID = 1000

--��Ҫ��Ч��ID	���ʹ��
x808087_g_ImpactID 	= 5929

--Ч����ID	������������ SelfimpactID,��ʹ�� impactId01,����ʹ�� impactId02
x808087_g_itemList = {}
x808087_g_itemList[30505210] = { SelfimpactID=5934, impactId01=5939, impactId02=0		 }			-- �˯��
x808087_g_itemList[30505212] = { SelfimpactID=5933, impactId01=0, 	 impactId02=5938 }			-- ������


--**********************************
--�¼��������
--**********************************
function x808087_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x808087_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x808087_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x808087_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	--���ʹ������û�й�����������
	if IsHaveMission( sceneId, selfId, x808087_g_MissionID ) <= 0 then
		x808087_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end
	
	--���ʹ���ߵ���ʹ������
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808087_g_ImpactID) == 0 then
		x808087_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808087_g_itemList[itemTblIndex];
	if not itemCur then
		x808087_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	--���鹥��Ŀ��ʹ������
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 0
	end

	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then				--��������....

		-- �˯��,�����򼲻�ܶ��Լ�ʹ��....
		if itemTblIndex == 30505210 or itemTblIndex == 30505212 then
			if selfId == targetId then
				LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
				return 0
			end
		end

		--��ⱻ��������û�й�����������
		if IsHaveMission( sceneId, targetId, x808087_g_MissionID ) <= 0 then
			x808087_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_061}" )
			return 0
		end
		
		--��ⱻ�����ߵ���ʹ������
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, targetId, x808087_g_ImpactID) == 0 then
			x808087_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_061}" )
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
function x808087_OnDeplete( sceneId, selfId )
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
function x808087_OnActivateOnce( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808087_g_itemList[itemTblIndex];
	if not itemCur then
		x808087_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 1
	end
	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--������������....
		-- ��ⱻ������Impact
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, targetId, itemCur.SelfimpactID) ~= 0 then
			if itemCur.impactId01 ~= 0 then
				LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, itemCur.impactId01, 0);
			end
		else
			if itemCur.impactId02 ~= 0 then
				LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, itemCur.impactId02, 0);
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
function x808087_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
-- ��Ŀ��ʾ
--**********************************
function x808087_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
