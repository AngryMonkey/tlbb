--���ȱʡ�ű�

--�ű���
x402042_g_ScriptId	= 402042

x402042_g_NotifyDay = --09�꿪����
{
	20090103,
	20090131,
	20090228,
	20090404,
	20090502,
	20090606,
	20090704,
	20090801,
	20090905,
	20091003,
	20091031,
	20091205,
}

--**********************************
--�ű���ں���
--**********************************
function x402042_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	
	-- ����ֻ��ÿ�µĵ�һ�͵���������������
	local nToday = GetTime2Day();
	for i, item in x402042_g_NotifyDay do
		if item == nToday then
			--����˵��������ID���ID��ʱ�������������ͣ����Բ�����Ĭ����ͨ�������ͣ�
			StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )	
		end
	end
	
end

--**********************************
--��������
--**********************************
function x402042_OnTimer( sceneId, actId, uTime )

	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end
