--ǧ�����

--�ű����
x502002_g_ScriptId	= 502002

--**********************************
--Monster Timer
--**********************************
function x502002_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--ȫ�򹫸�
	local str = "#P#{_BOSS9}�������ˣ����ĵĴ���ٴ����뼫���Ŀֲ�֮�У�"
	AddGlobalCountNews( sceneId, str )

	--ȡ��ʱ��
	SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--�����¼�
--**********************************
function x502002_OnDie( sceneId, objId, killerId )
end
