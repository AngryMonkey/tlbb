-- ������:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
-- ���ʹ�� ItemID 40004444

-- �ű���
x808084_g_scriptId = 808084

x808084_g_event = 808080				-- ������������ű�
--�����
x808084_g_MissionId			= 1000

--����ÿ�컷�����
x808084_g_Mission_RoundNum	 = 7		--��������ĵ�7λ

-- ������Ʒ�������
x808084_g_LuoYangLighten_Cnt 	= 5	--����������������������
x808084_g_SuZhouLighten_Cnt		= 7	--���������ݿ�����������
x808084_g_DaLiLighten_Cnt		= 9		--�����ƴ�������������

--����������������
x808084_g_KongMing_Lighten				= 4		--��������ĵ�4λ

x808084_g_KongMingLighten_Count		=	8		-- ÿ��·����Ҫ��ȼ�Ŀ���������
x808084_g_KongMingLighten_MaxCnt	=	24	-- �������ܻ��Ҫ��ȼ�Ŀ���������

-- ÿ��������ܻ����ʱ��
x808084_g_ActivityTime						= { {tstart=1230, tend=1330},
																		  {tstart=1930, tend=2030},
																		  {tstart=2130, tend=2230} }

--**********************************
--�¼��������
--**********************************
function x808084_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end


--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x808084_IsSkillLikeScript( sceneId, selfId )
	return 1	 --����ű���Ҫ����֧��
end


--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x808084_CancelImpacts( sceneId, selfId )
	return 0	 --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x808084_OnActivateEachTick( sceneId, selfId )
	return 1	 --���������Խű�, ֻ�����պ�����
end


--**********************************
--��Ϣ��ʾ
--**********************************
function x808084_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x808084_OnConditionCheck( sceneId, selfId )
	
	--�����е�λ��
	local	BagPos	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )

	if BagPos < 0 then
		return 0
	end
	
	--У��ʹ�õ���Ʒ�Ƿ����
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--�����û�й�����������
	if IsHaveMission( sceneId, selfId, x808084_g_MissionId ) <= 0 then
		x808084_MsgBox( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end

	--����Ƿ��ڻʱ����
	if x808084_CheckHuoDongTime() == 0 then
		x808084_MsgBox( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x808084_g_MissionId)
	
	--��ÿ����������Ϣ
	local LuoYangCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_LuoYangLighten_Cnt, 1)
	local SuZhouCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_SuZhouLighten_Cnt, 1)
	local DaLiCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_DaLiLighten_Cnt, 1)
	local	nAllCount = GetMissionParam(sceneId, selfId, misIndex, x808084_g_KongMing_Lighten)
		
	BeginEvent(sceneId)
		AddText(sceneId, "#{GodFire_Info_001}")
		local str01 = format("#{GodFire_Info_021} %d/%d", LuoYangCnt, x808084_g_KongMingLighten_Count)
		local str02 = format("#{GodFire_Info_022} %d/%d", SuZhouCnt, x808084_g_KongMingLighten_Count)
		local str03 = format("#{GodFire_Info_023} %d/%d", DaLiCnt, x808084_g_KongMingLighten_Count)
		local str04 = format("#{GodFire_Info_035} %d/%d", nAllCount, x808084_g_KongMingLighten_MaxCnt)
		AddText(sceneId, str01)
		AddText(sceneId, str02)
		AddText(sceneId, str03)
		AddText(sceneId, str04)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	return 1
	
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x808084_OnDeplete( sceneId, selfId )	
	--
	--�ڴ˻�Ҫ�ٴμ��һ��....
	--
	return 0
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x808084_OnActivateOnce( sceneId, selfId )
	return 0
end

--**********************************
--���ʱ��
--**********************************
function x808084_CheckHuoDongTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808084_g_ActivityTime) do
	  if curHourTime >= x808084_g_ActivityTime[i].tstart and curHourTime <= x808084_g_ActivityTime[i].tend then
	  	return i		
	  end
	end

	return 0

end
