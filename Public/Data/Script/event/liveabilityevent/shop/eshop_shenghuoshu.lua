--�̵�
--�����̵�
--���� ʥ����

--�ű���
x701607_g_ScriptId = 701607

--�̵��
x701607_g_shoptableindex=53

--�̵�����
x701607_g_ShopName = "����ʥ�����䷽"

--**********************************
--������ں���
--**********************************
function x701607_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId,targetId, x701607_g_shoptableindex )
end

--**********************************
--�о��¼�
--**********************************
function x701607_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ��Ǳ��ɵ���
	if GetMenPai(sceneId,selfId) == MP_MINGJIAO then
		AddNumText(sceneId,x701607_g_ScriptId,x701607_g_ShopName,7,-1)
    end
	return
end

--**********************************
--����������
--**********************************
function x701607_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701607_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701607_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701607_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x701607_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x701607_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x701607_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--���������¼�
--**********************************
function x701607_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x701607_OnItemChanged( sceneId, selfId, itemdataId )
end
