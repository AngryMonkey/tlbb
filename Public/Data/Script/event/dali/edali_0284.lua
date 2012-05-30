			
--BUS
--�������ŷ�������

x210284_g_ScriptId = 210284
x210284_g_busGuilList = {1000003, 1000004}


function x210284_OnDefaultEvent( sceneId, selfId, targetId )
	local bSucceeded = 0;
	strText = "�޿���������Ժ�";
	for i, busGuid in x210284_g_busGuilList do
		busId = LuaFnBusGetObjIDByGUID(sceneId, busGuid);
		if busId then
			if busId ~= -1 then
				ret = LuaFnBusAddPassenger_Shuttle(sceneId, busId, selfId, targetId, 0);
				if ret == OR_OK then
					strText = "���Ժ��������"
					bSucceeded = 1;
					break
				elseif ret == OR_BUS_PASSENGERFULL then
					strText = "�����������������һ�ࡣ"
					break
				elseif ret == OR_BUS_HASMOUNT then
					strText = "��������������ִ�д˲�����"
					break
				elseif ret == OR_BUS_HASPET then
					strText = "��������Я�������޵�ʱ��ִ�д˲�����"
					break
				elseif ret == OR_BUS_CANNOT_TEAM_FOLLOW then
					strText = "����������Ӹ���ʱִ�д˲�����"
					break
				elseif ret == OR_BUS_CANNOT_DRIDE then
					strText = "��������˫�����ʱִ�д˲�����"
					break
				elseif ret == OR_BUS_CANNOT_CHANGE_MODEL then
					strText = "�������ڱ���ʱִ�д˲�����"
					break
				else
				end
			end
		end
	end

	BeginEvent(sceneId)
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	if bSucceeded == 1 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1000)
	end
end



--**********************************

--�о��¼�

--**********************************

function x210284_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x210284_g_ScriptId, "��������", 9, -1);
end

