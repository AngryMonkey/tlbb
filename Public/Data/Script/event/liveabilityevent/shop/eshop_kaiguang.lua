--�̵�
--�����̵�
--���� ����

--�ű���
x701605_g_ScriptId = 701605

--�̵��
x701605_g_shoptableindex=51

--�̵�����
x701605_g_ShopName = "���򿪹��䷽"

--**********************************
--������ں���
--**********************************
function x701605_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId,targetId, x701605_g_shoptableindex )
end

--**********************************
--�о��¼�
--**********************************
function x701605_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ��Ǳ��ɵ���
	if GetMenPai(sceneId,selfId) == MP_SHAOLIN then
		AddNumText(sceneId,x701605_g_ScriptId,x701605_g_ShopName,7,-1)
    end
	return
end

--**********************************
--����������
--**********************************
function x701605_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701605_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701605_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701605_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x701605_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x701605_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x701605_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--���������¼�
--**********************************
function x701605_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x701605_OnItemChanged( sceneId, selfId, itemdataId )
end
