--������
--�˲�
--�ű���715018
--�˲�100%
--�ȼ�1

--ÿ�δ򿪱ض���õĲ�Ʒ
x715018_g_MainItemId = 40003023
--�����
x715018_g_MissionId = 1075

--���ɺ�����ʼ************************************************************************
--ÿ��ItemBox�����10����Ʒ
function	x715018_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����һ����Ʒ
	ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715018_g_MainItemId)	--ÿ�������������ܵõ�һ����Ʒ,����ֱ�ӷ���itembox��һ��
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x715018_OnOpen(sceneId,selfId,targetId)
	local ret = CallScriptFunction(SHIMEN_MISSION_SCRIPT_ID, "IsCaiJiMission", sceneId,selfId,x715018_g_MissionId,x715018_g_MainItemId)
	if ret > 0 then
		return OR_OK
	else
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	x715018_OnRecycle(sceneId,selfId,targetId)
	--����1�����������
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715018_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x715018_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
