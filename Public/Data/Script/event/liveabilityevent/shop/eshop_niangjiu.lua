--�̵�
--�����̵�
--ؤ�� ���

--�ű���
x701606_g_ScriptId = 701606

--�̵��
x701606_g_shoptableindex=59

--�̵�����
x701606_g_ShopName = "��������䷽"

--**********************************
--������ں���
--**********************************
function x701606_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId,targetId, x701606_g_shoptableindex )
end

--**********************************
--�о��¼�
--**********************************
function x701606_OnEnumerate( sceneId, selfId, targetId )
	--�ж��Ƿ��Ǳ��ɵ���
	if GetMenPai(sceneId,selfId) == MP_GAIBANG then
		AddNumText(sceneId,x701606_g_ScriptId,x701606_g_ShopName,7,-1)
    end
	return
end

--**********************************
--����������
--**********************************
function x701606_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701606_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701606_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701606_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x701606_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x701606_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x701606_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--���������¼�
--**********************************
function x701606_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x701606_OnItemChanged( sceneId, selfId, itemdataId )
end
