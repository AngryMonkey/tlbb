--����boss���䱦��������
--�޵�buff
x050055_strErrorNotice = "#{NSBS_20071228_10}"
x050055_g_impactID = 54

function x050055_OnRecycle(sceneId,selfId,targetId)
	
	return 1;
end

function x050055_OnCreate(sceneId,growPointType,x,y)

end

function x050055_OnOpen(sceneId,selfId,targetId)
	local level = GetLevel( sceneId, selfId )
	
	--����û��ȼ��Ƿ�10
	if level < 10 then
		BeginEvent(sceneId)
		AddText(sceneId, x050055_strErrorNotice);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_NEED_HIGH_LEVEL;
	end
	
	--2.�������߼���Ч
	--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x050055_g_impactID, 0)
	return OR_OK;
end

function x050055_OnProcOver(sceneId,selfId,targetId)
	--2.�������߼���Ч
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x050055_g_impactID, 0)
end
