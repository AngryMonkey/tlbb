--��Ϸ�Ż
--�ص��ű�

--�ű���
x808006_g_ScriptId			= 808006
x808006_g_ScriptId_Pao	= 200060	--���ݽű�
--�ID�������ڡ�ActivityNotice������
x808006_g_ActId					= 37
--���Ч�ڣ�2007��5��9����5��31
x808006_g_ActBegin			= 7129
x808006_g_ActEnd				= 7151

x808006_g_TickTime			= 60			--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x808006_g_PrizeMax			= 5				--ÿ�λ�д󽱵��������

--�����������
x808006_g_ActParam			=
{
	["tim"]			= 0,			--ʱ���ܵ���
	["n_chg"]		= 1,			--�һ�����
	["n_bty"]		= 2,			--������
}

--�ִ���
x808006_g_Str	=
{
	--������ת���ַ����ִ�
	["npc"]			= "#W�������֮ǰ�һ�����Ҫ��������ޱ���������������ˣ���֪����û����������������ɡ�",
	
	--����ת���ַ����ִ�
}

--**********************************
--�ű���ں���
--C++�ص�����
--**********************************
function x808006_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--ͳһֻ�������Ϊ x808006_g_ActId �Ļ
	m_actId		= x808006_g_ActId

	if x808006_OnActivityCheck() == 0 then
		--Add Log
		--begin modified by zhangguoxin 090207
		--LogInfo	= format( "[CIRCUS]: x808006_OnActivityCheck()==0, sceneId=%d, actId=%d, CurrentHour=%d",
		--	sceneId, m_actId, GetHourTime() )
		LogInfo	= format( "[CIRCUS]: x808006_OnActivityCheck()==0, sceneId=%d, actId=%d, CurrentHour=%d",
			sceneId, m_actId, GetQuarterTime() )
		--end modified by zhangguoxin 090207
		MissionLog( sceneId, LogInfo )
		return
	end

	--����˵��������ID���ID��ʱ���������룩
	StartOneActivity( sceneId, m_actId, floor(x808006_g_TickTime*1000), iNoticeType )

	--�������
	SetActivityParam( sceneId, m_actId, x808006_g_ActParam["tim"], 0 )		--����ʱ���ܵ���
	SetActivityParam( sceneId, m_actId, x808006_g_ActParam["n_chg"], 0 )	--����һ�����
	SetActivityParam( sceneId, m_actId, x808006_g_ActParam["n_bty"], 0 )	--���������

	--Add Log
	--begin modified by zhangguoxin 090207
	--LogInfo	= format( "[CIRCUS]: x808006_OnDefaultEvent( sceneId=%d, actId=%d, iNoticeType=%d ), CurrentHour=%d",
	--	sceneId, m_actId, iNoticeType, GetHourTime() )
	LogInfo	= format( "[CIRCUS]: x808006_OnDefaultEvent( sceneId=%d, actId=%d, iNoticeType=%d ), CurrentHour=%d",
		sceneId, m_actId, iNoticeType, GetQuarterTime() )
	--end modified by zhangguoxin 090207
	MissionLog( sceneId, LogInfo )

end

--**********************************
--��������
--C++�ص�����
--**********************************
function x808006_OnTimer( sceneId, actId, uTime )

	if x808006_g_ActId ~= actId then
		return
	end

	--�������
	tim		= GetActivityParam( sceneId, actId, x808006_g_ActParam["tim"] )
	SetActivityParam( sceneId, actId, x808006_g_ActParam["tim"], tim+1 )	--����ʱ���ܵ���

	--��ڵڶ����賿ǰ�ر�
	--begin modified by zhangguoxin 090207
	--hur		= GetHourTime()
	--qua		= hur - floor( hur / 100 ) * 100
	qua = mod(GetQuarterTime(),100);
	--end modified by zhangguoxin 090207
	--ȫ��96��ʱ��
	if qua >= 95 then
		x808006_OnActivityEnd( sceneId, actId )
	end
	
	--һСʱһ�ε�NPCƵ��
	mul		= tim - floor( tim / 60 ) * 60
	if tim == 59 then
		CallScriptFunction( x808006_g_ScriptId_Pao, "Paopao", sceneId, "��˹", "����", x808006_g_Str["npc"] )
	end

end

--**********************************
--�����
--**********************************
function x808006_OnActivityEnd( sceneId, actId )

	if x808006_g_ActId ~= actId then
		return
	end

	SetActivityParam( sceneId, actId, x808006_g_ActParam["tim"], 0 )			--����ʱ���ܵ���
	SetActivityParam( sceneId, actId, x808006_g_ActParam["n_chg"], 0 )		--����һ�����
	SetActivityParam( sceneId, actId, x808006_g_ActParam["n_bty"], 0 )		--���������
	StopOneActivity( sceneId, actId )

	--Add Log
	--begin modified by zhangguoxin 090207
	--LogInfo	= format( "[CIRCUS]: x808006_OnActivityEnd( sceneId=%d, actId=%d ), CurrentHour=%d",
	--	sceneId, actId, GetHourTime() )
	LogInfo	= format( "[CIRCUS]: x808006_OnActivityEnd( sceneId=%d, actId=%d ), CurrentHour=%d",
		sceneId, actId, GetQuarterTime() )
	--end modified by zhangguoxin 090207
	MissionLog( sceneId, LogInfo )

end

--**********************************
--����
--**********************************
function x808006_OnActivityCheck()

	local	day	= GetDayTime()
	if day < x808006_g_ActBegin or day > x808006_g_ActEnd then
		return 0
	end
	return 1

end

--**********************************
--�ɹ��һ�һ�Σ�����
--������
--**********************************
function x808006_OnSuccChange( sceneId )

	local	num_chg	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_chg"] )
	SetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_chg"], num_chg + 1 )
	return num_chg + 1

end

--**********************************
--�ɹ���һ�Σ�����
--������
--**********************************
function x808006_OnSuccPrize( sceneId )

	local	num_chg	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_chg"] )
	local	num_bty	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_bty"] )
	if num_bty >= x808006_g_PrizeMax then
		return 0
	end
	SetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_bty"], num_bty + 1 )
	--Add Log
	--begin modified by zhangguoxin 090207
	--LogInfo	= format( "[CIRCUS]: x808006_OnSuccPrize(), num_chg=%d, num_bty=%d, CurrentHour=%d",
	--	num_chg, num_bty, GetHourTime() )
	LogInfo	= format( "[CIRCUS]: x808006_OnSuccPrize(), num_chg=%d, num_bty=%d, CurrentHour=%d",
		num_chg, num_bty, GetQuarterTime() )
	--end modified by zhangguoxin 090207
	MissionLog( sceneId, LogInfo )
	return num_bty + 1

end

--**********************************
--�Ƿ��ڻ��
--**********************************
function x808006_IsActivityDoing( sceneId )

	tim	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["tim"] )
	if tim > 0 then
		return 1
	end
	return 0

end
