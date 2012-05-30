--------------------------------------------
--���Ϻ�«���߽ű�
--Created By ��ΰ
--------------------------------------------

--�ű�ID
x335908_g_scriptId = 335908
-- �ռ��鱨�����
x335908_g_MissionId = 1144;

--������Ϣ��
x335908_g_select_sceneId = 
{
	[1]=  {6, 	"����ɽ�İ�Գʯ��", 	53,264, },
	[2]=  {7, 	"����Ľ��ŵ���",   	130,135, },
	[3]=  {8, 	"�ػ͵�嫺����",			260,260, },
	[4]=  {5, 	"����������ٷ�",			39,261, },
	[5]=  {4, 	"̫������鿸�̨",			160,252, },
	[6]=  {3, 	"��ɽ�Ľ�ɽ�ཿ",			275,85, },
	[7]=  {30, 	"������һ������",     170,235, },
	[8]=  {24, 	"�����İ�������",     260,270, },
	[9]=  {18, 	"���ϵķ���Ϧ��",     150,250, },
	[10]= {31, 	"��Ȫ�ķ���ֱ��",     270,280, },
	[11]= {25, 	"��ɽ����ˮ�껪",     258,73, },
	[12]= {19, 	"�㱱�ı���ǧ��",     283,179, },
	[13]= {32, 	"���ĵ���������",     54,182, },
	[14]= {26, 	"ʯ�ֵķ������",     195,53, },
	[15]= {20, 	"��ԭ������ʯ��",     143,254, },
	[16]= {33, 	"÷���÷����",     284,82, },
	[17]= {27, 	"��Ϫ����ü�綹",     268,116, },
	[18]= {21, 	"�����İ������",     277,117, },
	[19]= {34, 	"�Ϻ�������һ��",     61,225, },
	[20]= {23,	"�����������ѩ��",   289,66, },
}

--**********************************
--�¼��������
--**********************************
function x335908_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x335908_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x335908_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x335908_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if IsHaveMission(sceneId, selfId, x335908_g_MissionId) ==  1 then	
		if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
			return 0;
		end	
		local ret, msg = x335908_IsFitCondition(sceneId, selfId);
		if ret == 0 then
			x335908_MsgBox( sceneId, selfId, msg );
			return 0;
		end
		--pass
		return 1;
	end
	return 0;
end

--**********************************
--�������ܿ�ʼ�ص��ӿڣ�
--ϵͳ���ڼ��ܿ�ʼ��ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1������ͨ�������Լ���ִ�У�����0��ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x335908_OnStartCharging( sceneId, selfId )	
	x335908_MsgBox(sceneId, selfId, "#{JZSJ_081119}");
	return 1;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x335908_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335908_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335908_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335908_g_MissionId);
		local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1) + 1;	
		SetMissionByIndex(sceneId, selfId, misIndex, 1, ringNum);  							--��������1
		--ֻ��Ҫ����ǰ2����̽���ĳ����š��������λ��������;�� x808010_g_StrForePart = 4
		if ringNum < 3 then
			SetMissionByIndex(sceneId, selfId, misIndex, ringNum+1, sceneId); 		--�ó����Ѵ�̽��	
		end		
		local msg = format("#{YHJZ_081007_35}������ȣ�%d/3", ringNum);
		x335908_MsgBox(sceneId, selfId, msg);	 --�ռ��ɹ����������һЩ����֮����
		if ringNum >= 3 then 																										-- �����������
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
			x335908_MsgBox(sceneId, selfId, "������ɣ�");
		end
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
function x335908_OnActivateEachTick( sceneId, selfId)
	return 1;
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x335908_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- ������� 
-- �ɹ���1  ʧ�ܣ�0
--**********************************
function x335908_IsFitCondition(sceneId, selfId)
 	--���ռ�3��������
 	local misIndex = GetMissionIndexByID(sceneId, selfId, x335908_g_MissionId);
 	local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1)
 	if ringNum >= 3 then
		return 0, "#{YHJZ_081007_31}" 		
 	end
 	--������ȷ��
 	local param = {}; 	
 	param[1] = GetMissionParam(sceneId, selfId, misIndex, 5);
 	param[2] = GetMissionParam(sceneId, selfId, misIndex, 6);
 	param[3] = GetMissionParam(sceneId, selfId, misIndex, 7);
 	local bFlag = 0;
 	local index = 0;
 	for i=1, 3 do
 		if x335908_g_select_sceneId[param[i]+1][1] == sceneId then
 			index = param[i]+1;
 			bFlag = 1;
 			break
 		end
 	end 
 	if bFlag == 0 then
 		return 0, "#{YHJZ_081007_32}";
 	end
 	--���ռ�����
 	for i=2, 3 do
 		if sceneId == GetMissionParam(sceneId, selfId, misIndex, i) then
 			return 0, "#{YHJZ_081007_33}";
 		end
 	end
 	--λ����ȷ��
 	local pos_x, pos_z = LuaFnGetWorldPos(sceneId, selfId);
 	local distance =
 	(x335908_g_select_sceneId[index][3]-pos_x) * (x335908_g_select_sceneId[index][3]-pos_x) + 
 	(x335908_g_select_sceneId[index][4]-pos_z) * (x335908_g_select_sceneId[index][4]-pos_z);	
 	if distance > 18 then
 		return 0, "�����ռ��ص�̫Զ��";
 	end
 	--������ӣ�
 	--1.�Ƿ����
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--2.�Ƿ�����
	if GetTeamSize(sceneId,selfId)~=2 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--3.�Ƿ��ڸ���
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--4.�Ƿ��Ƿ���
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,tid1)<=0 or LuaFnIsMarried(sceneId,tid2)<=0 then
		return 0, "#{YHJZ_081007_34}";
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			return 0, "#{YHJZ_081007_34}";
		end
	end	
	-- OK
	return 1, "ok";
end
