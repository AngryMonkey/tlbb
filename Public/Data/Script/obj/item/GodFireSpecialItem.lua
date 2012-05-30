--������:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]

--�������ܻ�������ʹ�ýű�


--�ű���
x808089_g_scriptId = 808089

--��Ҫ�ĵȼ�
--��Ҫ������ID
x808089_g_MissionID = 1000

--��Ҫ��Ч��ID	���ʹ��
x808089_g_ImpactID 	= 5929

x808089_g_itemList = {}
x808089_g_SpecialList = {}
x808089_g_itemList[30505209] = { SpecialID=47 }			-- ����Ƥ
x808089_g_itemList[30505211] = { SpecialID=48 }			-- ���޼�

--�����ID	������������ SelfimpactID,��ʹ�� impactId01,����ʹ�� impactId02
x808089_g_SpecialList[47] = { SelfimpactID=5933, impactId01=5936, impactId02=5935 }
x808089_g_SpecialList[48] = { SelfimpactID=5933, impactId01=0, 	 impactId02=5937 }

-- ���弤���ӳ�ʱ��_����
x808089_g_Special_DelayTime = 5000

--**********************************
--�¼��������
--**********************************
function x808089_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x808089_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x808089_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x808089_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	--���ʹ������û�й�����������
	if IsHaveMission( sceneId, selfId, x808089_g_MissionID ) <= 0 then
		x808089_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end
	
	--���ʹ���ߵ���ʹ������
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808089_g_ImpactID) == 0 then
		x808089_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );

	local itemCur = x808089_g_itemList[itemTblIndex];
	if not itemCur then
		x808089_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	return 1

end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x808089_OnDeplete( sceneId, selfId )
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
function x808089_OnActivateOnce( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808089_g_itemList[itemTblIndex];
	if not itemCur then
		x808089_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	local posX,posZ = GetWorldPos(sceneId, selfId)
	CreateSpecialObjByDataIndex(sceneId, selfId, itemCur.SpecialID, posX, posZ, x808089_g_Special_DelayTime )
	return 1;

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x808089_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
-- ��Ŀ��ʾ
--**********************************
function x808089_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--*****************************************************
-- ��Ҵ���Specialʱ�ص����ű�,���ݷ���ֵȷ���Ƿ���Ӧ
-- ����˵��:����ID,����Ͷ����ID,���崥����ID,����ID
--*****************************************************
function x808089_OnSpecialCheck( sceneId, AttackObjID, SpringObjID, SpecialId )

	--���鴥��������
	if AttackObjID < 0 or SpringObjID < 0 then
		return 0
	end
  
  local SpecialCur = x808089_g_SpecialList[SpecialId];
	if not SpecialCur then		
		return 0;
	end
	
	-- ���޼в��ܶ��Լ�ʹ��....
	if SpecialId == 48 then
		if AttackObjID == SpringObjID then			
			return 0
		end
	end
  
	--��ⱻ��������û�й�����������
	if IsHaveMission( sceneId, SpringObjID, x808089_g_MissionID ) <= 0 then
		return 0
	end
	
	--��ⱻ�����ߵ���ʹ������
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, SpringObjID, x808089_g_ImpactID) == 0 then
		return 0
	end
	
	return 1
end

--*************************************************
-- ��Ҵ���Specialʱ�ص������ű�,����Impact
-- ����˵��:����ID,���崥����ID,����ID
--*************************************************
function x808089_OnSpecialFadeOut( sceneId, SpringObjID, SpecialId )

	--���鴥��������
	if SpringObjID < 0 then
		return 0
	end
  
  local SpecialCur = x808089_g_SpecialList[SpecialId];
	if not SpecialCur then		
		return 0;
	end

	--��ⱻ��������û�й�����������
	if IsHaveMission( sceneId, SpringObjID, x808089_g_MissionID ) <= 0 then
		return 0
	end
	
	--��ⱻ�����ߵ���ʹ������
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, SpringObjID, x808089_g_ImpactID) == 0 then
		return 0
	end

	-- ��ⱻ������Impact
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, SpringObjID, SpecialCur.SelfimpactID) ~= 0 then
		if SpecialCur.impactId01 ~= 0 then
			LuaFnSendSpecificImpactToUnit(sceneId, SpringObjID, SpringObjID, SpringObjID, SpecialCur.impactId01, 0);
		end
	else
		if SpecialCur.impactId02 ~= 0 then
			LuaFnSendSpecificImpactToUnit(sceneId, SpringObjID, SpringObjID, SpringObjID, SpecialCur.impactId02, 0);
		end
	end

	return 1
end
