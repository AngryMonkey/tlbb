
-- �ű���
x801019_g_ScriptId = 801019
--**********************************
function x801019_OnDefaultEvent( sceneId, selfId, targetId )
	CallScriptFunction( 801016, "Broadcast_CANDIDATE_EXAM",sceneId, selfId )
end


--**********************************
--��������
--**********************************
function x801019_OnTimer( sceneId, actId, uTime )
end

