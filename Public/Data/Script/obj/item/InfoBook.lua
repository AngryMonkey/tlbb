--------------------------------------------
--�鱨�����߽ű�
--Created By ��ΰ
--------------------------------------------

--�ű�ID
x335807_g_scriptId = 335807
-- �ռ��鱨�����
x335807_g_MissionId = 1121;

--**********************************
--�¼��������
--**********************************
function x335807_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x335807_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x335807_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x335807_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if IsHaveMission(sceneId, selfId, x335807_g_MissionId) ==  1 then	
		if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
			return 0;
		end	
		if x335807_IsFitCondition(sceneId, selfId) == 0 then
			return 0;
		end
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335807_g_MissionId);	
		local flag = GetMissionParam(sceneId, selfId, misIndex, 5);
		if flag == 0 then
			x335807_MsgBox(sceneId, selfId, "�������ռ��鱨���벻Ҫ�뿪����������ᵼ���ռ��鱨ʧ�ܡ�"); 
			SetMissionByIndex(sceneId, selfId, misIndex, 5, 1);		
		end
		return 1;
	end
	return 0;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x335807_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335807_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335807_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335807_g_MissionId);
		local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1) + 1;	
		SetMissionByIndex(sceneId, selfId, misIndex, 1, ringNum);  				--��������1
		SetMissionByIndex(sceneId, selfId, misIndex, ringNum+1, sceneId); --�ó����Ѵ�̽��	
		SetMissionByIndex(sceneId, selfId, misIndex, 5, 0);								--��ʾ��Ϣ��ʶ
		if ringNum >= 3 then 																							-- �����������
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
		end
		local msg = "";
		msg = format("#{DT_80815_23}%d/3#{DT_80815_24}", ringNum);
		x335807_MsgBox(sceneId, selfId, msg);	
		return 1;
	end
	return 0;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335807_OnActivateEachTick( sceneId, selfId)
	return 1;
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x335807_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- ������� 
-- �ɹ���1  ʧ�ܣ�0
--**********************************
function x335807_IsFitCondition(sceneId, selfId)
	--����Ұ��ɳ��У�
	if GetCityGuildID(sceneId, selfId, sceneId) == -1 then
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_8}");
		return 0;
	elseif GetCityGuildID(sceneId, selfId, sceneId) == GetHumanGuildID(sceneId, selfId) then -- ������
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_9}");
		return 0;	
	end
	--�Ѵ�̽����
	local misIndex = GetMissionIndexByID(sceneId, selfId, x335807_g_MissionId);
 	for i=2, 3 do 	--2��3λ�����̽�ĵ�һ����������ID
 		local city = GetMissionParam(sceneId, selfId, misIndex, i);
 		if city == sceneId then
			x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_10}");
			return 0;	 			
 		end
 	end
 	--��ӣ�
 	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_11}");
		return 0;	 		
 	elseif GetTeamSize(sceneId, selfId) < 2 then
 		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_11}");
		return 0;	 		
 	end
 	local teamSize = GetTeamSize(sceneId, selfId);
 	--��Ա���ڸ���
 	if GetNearTeamCount(sceneId, selfId) < teamSize then
 		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_13}");
		return 0;	 		
 	end 	
 	--���鶼�Ǳ����Ա��
 	local guildId = GetHumanGuildID(sceneId, selfId);
 	for i=0, teamSize-1 do
 		local memGuid = GetTeamMemberGuid(sceneId, selfId, i);
 		local objId = LuaFnGuid2ObjId(sceneId, memGuid);
 		if objId ~= -1 then
			if GetHumanGuildID(sceneId, objId) ~= guildId then
				x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_12}");
				return 0;	 			
			end
	 	end
 	end
 	--�Ѵ�̽�������У�
 	local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1)
 	if ringNum >= 3 then
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_14}");
		return 0;	  		
 	end
	-- OK
	return 1;
end
