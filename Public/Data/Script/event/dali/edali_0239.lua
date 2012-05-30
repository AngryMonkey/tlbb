
--������������

--MisDescBegin
--�ű���
x210239_g_ScriptId = 210239

--��������NPC����
x210239_g_Position_X=160.0895
x210239_g_Position_Z=156.9309
x210239_g_SceneID=2
x210239_g_AccomplishNPC_Name="����ʦ"

--�����
x210239_g_MissionId = 719
--ǰ������ID
x210239_g_MissionIdPer = 718

--Ŀ��NPC
x210239_g_Name	="����ʦ"

--�������
x210239_g_MissionKind = 13

--����ȼ�
x210239_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x210239_g_IfMissionElite = 0

--������
x210239_g_MissionName="��������"
--��������
x210239_g_MissionInfo  = ""
x210239_g_MissionInfo1 = "    $N�����������ˡ�#r    �����������ڵĸ����Ѿ�����൱��ʵ��ȥ�Ŵ�����ѧϰ�����书�Ѿ���˳�����֮���ˡ�"
x210239_g_MissionInfo2 = "    �ԣ���û���������Ǵ�˵�еľŴ����ɡ���������������ڣ���ɽ�����������⣬������������֧������ң�������û������������ڣ��䵱�ɵ����ɷ磬���������µ�һ��̣�ؤ�������µ�һ�������ɸ����������ֵ�̩ɽ������"
x210239_g_MissionInfo3 = "    �������������һ�����ɣ�����̤����һ����������������ϸ���������϶��йⰡ��"
x210239_g_MissionInfo4 = "    �����ɣ���ȥ�ҾŴ����ɵ���¼�����ģ������ǽ����������ɵ���ɫ��Ȼ��ѡ��һ�����ɼ��롣�����Ϊ�˾Ŵ����ɵĵ��ӣ����������ң����ǻ���㿪һ���칦��ġ�"

--����Ŀ��
x210239_g_MissionTarget="#{MIS_dali_ZTS_001}"
--δ��������npc�Ի�
x210239_g_ContinueInfo="    �Ѿ���Ϊ�Ŵ����ɵĵ�������"
--�ύʱnpc�Ļ�
x210239_g_MissionComplete="    �������Ѿ�ѡ������ȷ��������·������δ�����ܰɣ�"


x210239_g_ItemBonus={}


x210239_g_IsMissionOkFail = 0		--�����ĵ�0λ
x210239_g_Custom	= { {id="�Ѽ�������",num=1} }--�����ĵ�1λ

--x210239_g_MenpaiArray = {}


--MisDescEnd


--ȡ�ô���������Ӧ�õľ���ֵ��
function x210239_GetExpByMenpaiIndex( MenPaiIndex )
    --�������ɵ����������Ӧ�õľ���ֵ��

    local ReturnVal = 0

    if( 0 == MenPaiIndex ) then
        ReturnVal = 3000
    end
    if( 1 == MenPaiIndex ) then
        ReturnVal = 2900
    end
    if( 2 == MenPaiIndex ) then
        ReturnVal = 2600
    end
    if( 3 == MenPaiIndex ) then
        ReturnVal = 2500
    end
    if( 4 == MenPaiIndex ) then
        ReturnVal = 2200
    end
    if( 5 == MenPaiIndex ) then
        ReturnVal = 2000
    end
    if( 6 == MenPaiIndex ) then
        ReturnVal = 1200
    end
    if( 7 == MenPaiIndex ) then
        ReturnVal = 1000
    end
    if( 8 == MenPaiIndex ) then
        ReturnVal = 900
    end

    return ReturnVal

end


--0���� 1���� 2ؤ�� 3�䵱 4���� 5���� 6���� 7��ɽ 8��ң
--��������IDȡ���������ƣ����֣�
function x210239_GetMenpaiName( Menpai)
    local Name = "������"

    if( 0 == Menpai ) then
         Name = "������"
    elseif( 1 == Menpai ) then
         Name = "����"
    elseif( 2 == Menpai ) then
         Name = "ؤ��"
    elseif( 3 == Menpai ) then
         Name = "�䵱��"
    elseif( 4 == Menpai ) then
         Name = "������"
    elseif( 5 == Menpai ) then
         Name = "������"
    elseif( 6 == Menpai ) then
         Name = "������"
    elseif( 7 == Menpai ) then
         Name = "��ɽ��"
    elseif( 8 == Menpai ) then
         Name = "��ң��"
    end

    return Name

end

function x210239_MenpaiSort()
    local MenpaiArray = {}
    local Max0 = 3
    local ZeroCount =0

    for i=1, 9 do
        MenpaiArray[ i ] = LuaFnGetWorldGlobalData( Max0 - 1 + i )
        if( 0 == MenpaiArray[ i ] ) then
            ZeroCount = ZeroCount + 1
        end
    end

    if( 9 == ZeroCount ) then
        MenpaiArray[ 1 ] = 6
        MenpaiArray[ 2 ] = 2
        MenpaiArray[ 3 ] = 7
        MenpaiArray[ 4 ] = 5
        MenpaiArray[ 5 ] = 8
        MenpaiArray[ 6 ] = 0
        MenpaiArray[ 7 ] = 3
        MenpaiArray[ 8 ] = 4
        MenpaiArray[ 9 ] = 1
    end

    return MenpaiArray

end

--�����������У�ʹ���������ݵ�3,4,5,6,7
function x210239_SaveMenpaiArray( sceneId, selfId, MenpaiArray )
    --0���� 1���� 2ؤ�� 3�䵱 4���� 5���� 6���� 7��ɽ 8��ң
		--ʹ����������3,4,5,6,7�����������������

    local MixDWORD = 0
    local CurMenpai
    local misIndex = GetMissionIndexByID(sceneId,selfId,x210239_g_MissionId)

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 1 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 2 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 3, MixDWORD)   --����������ɣ������������ݵ�3�����ݵĸ�16λ���ڶ����ڵ�3�����ݵĵ�16λ

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 3 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 4 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 4, MixDWORD)   --�����������ɣ������������ݵ�4�����ݵĸ�16λ�����ķ��ڵ�4�����ݵĵ�16λ

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 5 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 6 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 5, MixDWORD)   --�����������ɣ������������ݵ�5�����ݵĸ�16λ���������ڵ�5�����ݵĵ�16λ

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 7 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 8 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 6, MixDWORD)   --�����������ɣ������������ݵ�6�����ݵĸ�16λ���ڰ˷��ڵ�6�����ݵĵ�16λ

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 9 ] )
    MixDWORD = SetLowWord ( MixDWORD, 0 )
    SetMissionByIndex( sceneId, selfId, misIndex, 7, MixDWORD)   --�����ھ����ɣ������������ݵ�7�����ݵĸ�16λ����16λ��0

end


--**********************************
--������ں���
--**********************************
function x210239_OnDefaultEvent( sceneId, selfId, targetId )

   --x210239_GetMenpaiIndex( 9 )
  --��������ɹ��������
  if (IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x210239_g_MissionId) > 0)  then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x210239_g_MissionName)
			AddText(sceneId, x210239_g_ContinueInfo)
		EndEvent( )
		local bDone = x210239_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId,bDone)

	--���������������
  elseif x210239_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		local MenpaiArray = x210239_MenpaiSort()

		BeginEvent(sceneId)
			AddText(sceneId,x210239_g_MissionName)
			AddText(sceneId,x210239_g_MissionInfo1)
			AddText(sceneId,x210239_g_MissionInfo2)
			AddText(sceneId,x210239_g_MissionInfo3)
			AddText(sceneId,x210239_g_MissionInfo4)


			local MixStr1 = ""
			local MixStr2 = ""
			for i=1, 9 do
			    if( i <= 5 ) then
			        local MenpaiName = x210239_GetMenpaiName( MenpaiArray[ i ] )
			        local MenpaiExp  = x210239_GetExpByMenpaiIndex( i - 1 )
			        local Str = "    ��������" ..MenpaiName.. "���㽫�õ�"..MenpaiExp.."�㾭�齱��"
			        MixStr1 = MixStr1..Str.."#r"
			    end

			    if( i>5 and i<=9 ) then
			        local MenpaiName = x210239_GetMenpaiName( MenpaiArray[ i ] )
			        local MenpaiExp  = x210239_GetExpByMenpaiIndex( i - 1 )
			        local Str = "    ��������" ..MenpaiName.. "���㽫�õ�"..MenpaiExp.."�㾭�齱��"
			        MixStr2 = MixStr2..Str.."#r"
			    end

			end
			AddText( sceneId, MixStr1 )
      AddText( sceneId, MixStr2 )

			--AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,"#{M_MUBIAO}#r"..x210239_g_MissionTarget)

			--AddText(sceneId,"#{M_SHOUHUO}")
			--AddMoneyBonus( sceneId, x210239_g_MoneyBonus )
			--for i, item in x210239_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		--    DispatchMissionInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId)
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId, 0 )

		--x210239_OnAccept( sceneId, selfId )
		x210239_DirectAccept( sceneId, selfId, MenpaiArray )

	end
end


--ֱ�ӽ�������û�о���������
function x210239_DirectAccept( sceneId, selfId, MenpaiArray )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 then
		return
	end

	-- ������������б�
	local ret = AddMission( sceneId,selfId, x210239_g_MissionId, x210239_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"��������:#Y" .. x210239_g_MissionName, MSG2PLAYER_PARA )


	local misIndex = GetMissionIndexByID(sceneId,selfId,719)
	local Menpai = LuaFnGetMenPai( sceneId, selfId )

  if( Menpai >= 0 and Menpai < 9 ) then
		  SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)    --����׷�������־ 1/1
	    SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)    --����������
  end

  x210239_SaveMenpaiArray( sceneId, selfId, MenpaiArray )

end



--**********************************
--�о��¼�
--**********************************
function x210239_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 then
		return
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x210239_g_MissionId) > 0 then

	    local bDone = x210239_CheckSubmit( sceneId, selfId )
	    if( 1 == bDone ) then
	        AddNumText(sceneId, x210239_g_ScriptId, x210239_g_MissionName, 2, -1);
	    else
	        AddNumText(sceneId, x210239_g_ScriptId, x210239_g_MissionName, 1, -1);
	    end

	--���������������
	elseif x210239_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x210239_g_ScriptId, x210239_g_MissionName, 1, -1);
	end
end

--**********************************
--����������
--**********************************
function x210239_CheckAccept( sceneId, selfId )

	--Ҫ����ɵ�ǰ������
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionIdPer) <= 0 then
		return 0
	end

    return 1
end

--**********************************
--����
--**********************************
function x210239_OnAccept( sceneId, selfId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 then
		return
	end

	-- ������������б�
	local ret = AddMission( sceneId,selfId, x210239_g_MissionId, x210239_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	--���������������ĳ�����ź�����λ��
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x210239_g_MissionId)--�õ�������20�������е����к�
	--SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����

	Msg2Player(  sceneId, selfId,"��������:#Y" .. x210239_g_MissionName, MSG2PLAYER_PARA )


	misIndex = GetMissionIndexByID(sceneId,selfId,719)
	local Menpai = LuaFnGetMenPai( sceneId, selfId )
  if( Menpai >= 0 and Menpai < 9 ) then
		  SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)    --����׷�������־ 1/1
	    SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)    --����������
  end

end

--**********************************
--����
--**********************************
function x210239_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x210239_g_MissionId )
end

--**********************************
--����
--**********************************
function x210239_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210239_g_MissionName)
		AddText(sceneId,x210239_g_MissionComplete)

		for i, item in x210239_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210239_CheckSubmit( sceneId, selfId )

    local MenPai = GetMenPai( sceneId, selfId )

    if( MenPai > 8 ) then
        return 0
    end

    if( MenPai < 0 ) then
        return 0
    end

	return 1

end


--***********************************************
--����������ɺʹ������������е�����������㾭��
--***********************************************
function x210239_CalculatePlayerExp( sceneId, selfId )
    local Exp = 0
    local MenpaiArray ={}
    for i=1, 9 do
        MenpaiArray[ i ] = 0
    end

    if IsHaveMission(sceneId,selfId,x210239_g_MissionId) > 0 then
        local misIndex = GetMissionIndexByID(sceneId, selfId, x210239_g_MissionId)

        local MixDWORD
        local High
        local Low
        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 3)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 1 ] = High
        MenpaiArray[ 2 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 4)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 3 ] = High
        MenpaiArray[ 4 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 5)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 5 ] = High
        MenpaiArray[ 6 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 6)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 7 ] = High
        MenpaiArray[ 8 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 7)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 9 ] = High

    end

    local MenpaiID = LuaFnGetMenPai( sceneId, selfId )

    for i=1, 9 do
        if( MenpaiArray[ i ] == MenpaiID ) then
            Exp = x210239_GetExpByMenpaiIndex( i - 1 )
        end
    end

    return Exp
end
--**********************************
--�ύ
--**********************************
function x210239_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- ��ȫ�Լ��
		-- 1���������ǲ������������
		if IsHaveMission(sceneId,selfId,x210239_g_MissionId) <= 0 then
			return
		end

		-- 2����������������
		if x210239_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end

		local nPlayerExp = x210239_CalculatePlayerExp( sceneId, selfId )


		-- ��Ǯ�;���
		LuaFnAddExp( sceneId, selfId, nPlayerExp)

		DelMission( sceneId,selfId, x210239_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId, x210239_g_MissionId )

		local MenpaiID = LuaFnGetMenPai( sceneId, selfId )
    local MenpaiName = x210239_GetMenpaiName( MenpaiID )

    local PlayerName = GetName( sceneId, selfId )
    local PlayerSex=GetSex(sceneId,selfId)

    local strSex = ""
    if PlayerSex == 0 then
        strSex = "��"
    else
        strSex = "��"
    end

    local SysStr = "#Y����ʦ�󺰣��Ĵ����˵�����#{_INFOUSR"..PlayerName .."}�Ѿ���Ϊ��"..MenpaiName.."�ĵ��ӣ��ϸ��������һ����ף��"..strSex.."�ɣ�#W"

    --local SysStr = "#Y����ʦ�󺰣��Ĵ����˵�����$N�Ѿ���Ϊ��"..MenpaiName.."�ĵ��ӣ��ϸ��������һ����ף�����ɣ�#W"
    
    if IsPermitAreetAddMenpai()==1 then --modi:lby20071107���ּ��������Ƿ�֪ͨ���
    	BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
		end


end

--**********************************
--ɱ����������
--**********************************
function x210239_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--���������¼�
--**********************************
function x210239_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210239_OnItemChanged( sceneId, selfId, itemdataId )
end







