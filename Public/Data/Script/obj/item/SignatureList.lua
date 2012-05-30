--------------------------------------------
--ǩ��¼���߽ű�
--Created By ��ΰ
--------------------------------------------

--�ű�ID
x335806_g_scriptId = 335806
--ǩ������ID
x335806_g_signatureId = 40004452; 
--���ռ�����
x335806_g_FullNum = 15;
-- �ռ�ǩ�������
x335806_g_MissionId = 1130;

--**********************************
--�¼��������
--**********************************
function x335806_OnDefaultEvent( sceneId, selfId, bagIndex )	

end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x335806_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x335806_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x335806_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if 1 ~= LuaFnVerifyUsedItem(sceneId, selfId) then
		return 0;
	end
	if x335806_IsFitCondition(sceneId, selfId) == 0 then
		return 0;
	end
	-- ���ͨ��
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	local myName = GetName(sceneId, selfId);
	BeginEvent(sceneId)
		local text = format("#{_INFOUSR%s}���ڶ����ռ�ǩ�����벻Ҫ�뿪������Χ��", myName);
		AddText(sceneId, text);
	EndEvent()
	DispatchMissionTips(sceneId, targetId);
	return 1;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x335806_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335806_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335806_g_MissionId);
		SetMissionByIndex(sceneId, selfId, misIndex, 2, 1);
	end	
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335806_OnActivateEachTick( sceneId, selfId)
	--�������Ƿ񳬾���
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	local cur_x, cur_y = LuaFnGetWorldPos(sceneId, selfId);
	local cur_x2, cur_y2 = LuaFnGetWorldPos(sceneId, targetId);
	if (cur_x2-cur_x)*(cur_x2-cur_x) + (cur_y2-cur_y)*(cur_y2-cur_y) > 30 then 	
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_14}");
		return 0;	
	end
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335806_g_MissionId);
		local tickCount = GetMissionParam(sceneId, selfId, misIndex, 2)
		if tickCount >= 60 then --1����ʱ�䵽������������
			--�������
			if x335806_IsFitCondition(sceneId, selfId) == 0 then
				return 0;
			end		
			--������ǩ������
			local bagPos = TryRecieveItem(sceneId, selfId, x335806_g_signatureId, QUALITY_MUST_BE_CHANGE);
			if bagPos == -1 then
				x335806_MsgBox(sceneId, selfId, "������ǩ������ʧ�ܣ�");
				return 0;
			end
			--ǩ��
			local targetId = LuaFnGetTargetObjID(sceneId, selfId);
			local friendName = GetName(sceneId, targetId);
			LuaFnSetItemCreator(sceneId, selfId, bagPos, friendName);
			local num = GetItemCount(sceneId, selfId, x335806_g_signatureId);
			SetMissionByIndex(sceneId, selfId, misIndex, 1, num);
			if num >= x335806_g_FullNum then
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
			end
			local text = format("�Ѿ��ɹ��ռ���%d/15��ǩ����", num);
			x335806_MsgBox(sceneId, selfId, text);	
		end		
		SetMissionByIndex(sceneId, selfId, misIndex, 2, tickCount+1);
	end		
	return 1;   
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x335806_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- ������� 
-- �ɹ���1  ʧ�ܣ�0
--**********************************
function x335806_IsFitCondition(sceneId, selfId)
	--�ռ�������
	local text = "";
	if LuaFnGetItemCount(sceneId, selfId, x335806_g_signatureId) >= x335806_g_FullNum then
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_09}");
		return 0;
	end
	--ѡ��ʹ�ö����ˣ�
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	if targetId < 0 or targetId == selfId then
		x335806_MsgBox(sceneId, selfId, "#{YRJ_SelfUseTip}");	
		return 0;
	end	
	--ֻ�ܸ����ʹ��
	local objType = GetCharacterType( sceneId, targetId )--��������
	if(objType ~= 1)then	--������Human
		x335806_MsgBox( sceneId, selfId, "#{ResultText_8}")	--��ЧĿ��
		return 0
	end	
	--�Ǻ��ѣ�
	if LuaFnIsFriend(sceneId, selfId, targetId) == 1 then
		if LuaFnGetFriendPoint(sceneId, selfId, targetId) < 200 then --200�Ѻöȣ�
			x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_10}");
			return 0;
		end
	else --�Ǻ���
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_11}");
		return 0;
	end	
	--��������
	local cur_x, cur_y = LuaFnGetWorldPos(sceneId, selfId);
	local cur_x2, cur_y2 = LuaFnGetWorldPos(sceneId, targetId);
	if (cur_x2-cur_x)*(cur_x2-cur_x) + (cur_y2-cur_y)*(cur_y2-cur_y) > 30 then 	
		x335806_MsgBox(sceneId, selfId, "������Χ��");
		return 0;	
	end
	--���иú���ǩ����
	local friendName = GetName(sceneId, targetId);
	local taskBagStartPos	= LuaFnGetMaterialEndBagPos(sceneId, selfId) + 1;
	for i=taskBagStartPos, taskBagStartPos+19 do
		local bSucc, Creator = LuaFnGetItemCreator(sceneId, selfId, i);
		if friendName == Creator then
			x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_12}");
			return 0;
		end
	end
	--�������пռ䣿
	if LuaFnGetTaskItemBagSpace(sceneId, selfId) == 0 then
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_13}");
		return 0;		
	end
	--��������
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 0 then
		x335806_MsgBox(sceneId, selfId, "���ѷ���ǩ�����񣬸õ��߲����ã�");
		return 0;		
	end
	--OK
	return 1;
end
