--���ߣ��ﹱ��30900050
--�ű��� 300070

x300070_g_scriptId = 300070

x300070_g_TakeTimes = 1											-- ÿ�����ʹ�ô���

--**********************************
--�¼��������
--**********************************
function x300070_OnDefaultEvent( sceneId, selfId, bagIndex )

	local BangPaiID = GetBagItemParam(sceneId, selfId, bagIndex, 4, 2) --����ID
	local value = GetBagItemParam(sceneId, selfId, bagIndex, 8, 2) --�ﹱ��ֵ
	local roleBangPaiID = GetHumanGuildID(sceneId, selfId)
	
	--PrintStr("BangPaiID "..BangPaiID.." value "..value.." roleBangPaiID "..roleBangPaiID)
	
	--����ID�Ƿ���ͬ
	if roleBangPaiID ~= BangPaiID then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8829_06}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, selfId)
		
		return
	end
	
	--һ��ֻ��ʹ�� x300070_g_TakeTimes ��
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME, nowDate )
	end

	if takenTimes >= x300070_g_TakeTimes then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8922_31}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, selfId)
		
		return 0
	end
	
	if EraseItem(sceneId, selfId, bagIndex) > 0 then
	
		CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, value)
	
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8829_04}"..value.."#{BGCH_8829_12}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		--һ��ֻ��ʹ�� x300070_g_TakeTimes ��
		DayTimes = GetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME )
		takenTimes = floor( DayTimes/100000 )
		DayTimes = (takenTimes+1)*100000 + GetDayTime()
		SetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME, DayTimes )
	end
	
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300070_IsSkillLikeScript( sceneId, selfId)
	return 0; --����ű���Ҫ����֧��
end
