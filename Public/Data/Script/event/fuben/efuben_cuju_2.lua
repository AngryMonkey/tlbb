--���ȱʡ�ű�

--�ű���
x402043_g_ScriptId	= 402043

--**********************************
--�ű���ں���
--**********************************
function x402043_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	
	-- ����ֻ��ÿ�µĵ�һ�͵��������տ�����
	local nToday = LuaFnGetDayOfThisMonth()
	if (nToday > 7 and nToday < 15) or (nToday > 21) then -- zchw
		return
	end

	--����˵��������ID���ID��ʱ�������������ͣ����Բ�����Ĭ����ͨ�������ͣ�
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )
	
end

--**********************************
--��������
--**********************************
function x402043_OnTimer( sceneId, actId, uTime )

	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end
