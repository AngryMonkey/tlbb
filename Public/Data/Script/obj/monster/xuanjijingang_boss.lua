--�������

--�ű����
x502001_g_ScriptId	= 502001

--**********************************
--Monster Timer
--**********************************
function x502001_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--ȫ�򹫸�
	local str = "#P#{_BOSS7}�������ˣ���ɽ�Ĵ���ٴ��������׵Ŀֲ�֮�У�"
	AddGlobalCountNews( sceneId, str )
	--ȡ��ʱ��
	SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--�����¼�
--**********************************
function x502001_OnDie( sceneId, objId, killerId )

end
