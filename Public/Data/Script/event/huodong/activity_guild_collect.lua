--�����ռ��Ļ�ű�
--Created by zchw
--�ű���
x808041_g_ScriptId	= 808041
x808041_g_Time = 2000;

--**********************************
--�ű���ں���
--**********************************
function x808041_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--����˵��������ID���ID��ʱ�������������ͣ����Բ�����Ĭ����ͨ�������ͣ�
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )

end

--**********************************
--��������
--**********************************
function x808041_OnTimer( sceneId, actId, uTime )
	local curTime = GetHour()*100 + GetMinute();
	if curTime >= x808041_g_Time and curTime < x808041_g_Time+1 then
		--�����ռ� ����
		LuaFnSortGuildCollectNum(sceneId); 		
	end
	--����Ƿ����
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		LuaFnClearGuildCollectNum(sceneId);
		StopOneActivity( sceneId, actId )
	end
end
