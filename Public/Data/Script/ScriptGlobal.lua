
--�����id ���

	OR_OK								= 0		-- �ɹ�,�������0��Ϊ�ɹ�,�������������ֵ��Ϊʧ��
	OR_ERROR							= -1	-- δ֪����
	OR_DIE								= -2	-- ��������
	OR_INVALID_SKILL					= -3	-- ��Ч����
	OR_TARGET_DIE						= -4	-- Ŀ��������
	OR_LACK_MANA						= -5	-- MANA����
	OR_COOL_DOWNING						= -6	-- ��ȷʱ��δ��
	OR_NO_TARGET						= -7	-- û��Ŀ��
	OR_INVALID_TARGET					= -8	-- ��ЧĿ��
	OR_OUT_RANGE						= -9	-- �������
	OR_IN_RANGE							= -10	-- ����̫��
	OR_NO_PLATFORM						= -11	-- û�в���ƽ̨
	OR_OUT_PLATFORM						= -12	-- �����ƽ̨̫Զ
	OR_NO_TOOL							= -13	-- û�в�������
	OR_STUFF_LACK						= -14	-- ȱ�ٲ���
	OR_BAG_OUT_OF_SPACE					= -15	-- ����ȱ�ٿռ�
	OR_WARNING							= -16	-- ��������Щ���󽫱��ͻ��˹��ˣ�����������֣�����������һЩ���
	OR_BUSY								= -17	-- ��������������
	OR_MISSION_HAVE						= -18	-- �Ѿ�ӵ�и�����
	OR_MISSION_LIST_FULL				= -19	-- �����¼����
	OR_MISSION_NOT_FIND					= -20	-- ��û���������
	OR_EXP_LACK							= -21	-- �����Ȳ���
	OR_CHAR_DO_NOT_KNOW_THIS_SKILL		= -22	-- ��ɫ���������ּ���
	OR_NO_SCRIPT						= -23	-- Ŀ���ɫ�޽ű�
	OR_NOT_ENOUGH_HP					= -24	-- û���㹻������ֵ
	OR_NOT_ENOUGH_RAGE					= -25	-- û���㹻��ŭ��ֵ
	OR_NOT_ENOUGH_STRIKE_POINT			= -26	-- û���㹻��������
	OR_NOT_ENOUGH_ITEM					= -27	-- û���㹻�ĵ���
	OR_NOT_ENOUGH_VIGOR					= -28	-- û���㹻�Ļ���
	OR_NO_LEVEL							= -29 	-- ���ܵȼ�����
	OR_CANNOT_UPGRADE					= -30	-- ��ʯ�޷�������
	OR_FAILURE							= -31	-- ����ʧ��
	OR_GEM_CONFLICT						= -32	-- һ��װ���ϲ�����װ��ͬ���͵ı�ʯ
	OR_NEED_IN_FURY_STANCE				= -33	-- ��Ҫ�ڿ�״̬��ʹ��
	OR_INVALID_TARGET_POS				= -34	-- ��ЧĿ���
	OR_GEM_SLOT_LACK					= -35	-- ȱ����ʯ���
	OR_LIMIT_MOVE						= -36	-- �޷��ƶ�
	OR_LIMIT_USE_SKILL					= -37	-- �޷�ʹ�ü���
	OR_INACTIVE_SKILL					= -38	-- ʹ����δ����ļ���
	OR_TOO_MUCH_HP						= -39	-- HP�����޶���ֵ
	OR_NEED_A_WEAPON					= -40	-- ��Ҫһ������
	OR_NEED_HIGH_LEVEL_XINFA			= -41	-- �ķ��ȼ�����
	OR_NEED_LEARN_SKILL_FIRST			= -42	-- ��δѧ��˼���
	OR_NEED_MENPAI_FOR_LEVELUP			= -43	-- ������ʦ����һ�����ɲ��ܼ�������
	OR_U_CANNT_DO_THIS_RIGHT_NOW		= -44 	-- �������޷�������
	OR_ROBOT_TIMEOUT					= -45	-- �һ�ʱ�䳬ʱ
	OR_NEED_HAPPINESS					= -46	-- ������޿��ֶȲ���60�����ܳ�ս����Ҫѱ��
	OR_NEED_HIGH_LEVEL					= -47	-- ��ĵȼ�����
	OR_CANNOT_GETEXP					= -48	-- ����������޷��ȵ�����
	OR_NEED_LIFE						= -49	-- �����������Ϊ0���޷����ٻ�����Ϊ����������
	OR_EXP_FULL							= -50	-- ���ľ����Ѿ���������
	OR_TOO_MANY_TRAPS					= -51 	-- �޷����ø���Ĵ�������
	OR_PET_PLACARD_ISSUE_FAILED			= -52	-- ����ʧ��
	OR_PET_PLACARD_NOT_APPOINT_PET		= -53	-- δָ������
	OR_PET_PLACARD_ONLY_CAN_ISSUE_ONE	= -54	-- �Բ���ͬʱֻ�ܷ���һֻ����
	OR_PET_PLACARD_NEED_PET_TYPE		= -55	-- �Բ���������޺����Ǳ���Ŷ
	OR_PET_PLACARD_NEED_PET_LEVEL		= -56	-- �Բ���������޼��𻹲���Ŷ
	OR_PET_PLACARD_NEED_PET_HAPPINESS	= -57	-- �Բ���������޿���ֵ������
	OR_PET_PLACARD_NEED_PET_LIFE		= -58	-- �Բ������������������
	OR_NEED_IN_STEALTH_MODE				= -59	-- ��Ҫ������״̬��ʹ��
	OR_NOT_ENOUGH_ENERGY				= -60	-- �Բ�����ľ�������
	OR_CAN_NOT_MOVE_STALL_OPEN			= -61	-- �޷��ڰ�̯���ƶ�
	OR_NEED_IN_SHIELD_MODE				= -62	-- ��Ҫ�ڻ��屣����
	OR_PET_DIE							= -63	-- ��������Ѿ�����
	OR_PET_HADRECALL_NEEDHAPPINESS		= -64	-- ������޿��ֶȲ���60���ѱ��ջ�
	OR_PET_HADRECALL_NEEDLIFE			= -65	-- �����������Ϊ0���ѱ��ջ�
	OR_GEM_NOT_FIT_EQUIP				= -66	-- ���ֱ�ʯ������Ƕ������װ����
	OR_CANNOT_ASK_PETDETIAL				= -67	-- ���޷��쿴�����޵���Ϣ
	OR_ARIANCEPET_CANNOT_RETURNTOCHILD	= -68	-- �������޲��ܽ��л�ͯ
	OR_COMBAT_CANNOT_RETURNTOCHILD		= -69	-- ��ս���޲��ܽ��л�ͯ
	OR_IMPASSABLE_ZONE					= -70	-- ����������
	OR_NEED_SETMINORPASSWORD			= -71	-- ��Ҫ���� ��������
	OR_NEED_UNLOCKMINORPASSWORD			= -72	-- ��Ҫ���� ��������
	OR_PETINEXCHANGE_CANNOT_GOFIGHT		= -73	-- ���ڽ��׵������޷���ս
	OR_HASSPOUSE_CANNOT_RETURNTOCHILD	= -74	-- �Ѿ�����ż�����޲��ܻ�ͯ
	OR_CAN_NOT_FIND_SPECIFIC_ITEM		= -75	-- ȱ��ָ����Ʒ
	OR_HOUSE_SLOT_IS_EMPTY				= -76	-- ��Ҫ��װ������
	OR_NEED_EQUITATION_FIRST			= -77	-- ��Ҫ��ѧ����Ӧ������
	OR_USE_A_DAMAGED_EQUIPMENT			= -78	-- װ���Ѿ���
	OR_EQUIPMENT_DAMAGED				= -79	-- װ���Ѿ���
	OR_PET_PROCREATE_HAE_REGISTER				= -80	-- ˫������һ�˵������Ѿ��ڴ˷�ֳ������ͬʱ��ֳ1�����ϵ�����
	OR_PET_PROCREATE_NO_LOCALITY				= -81	-- �Ѿ�û�п�λ��
	OR_PET_PROCREATE_NEED_BABY_PET				= -82	-- ˫�����ޱ��趼�����ޱ���
	OR_PET_PROCREATE_NEED_SAME_PHYLE			= -83	-- ˫�����ޱ�����ͬ��
	OR_PET_PROCREATE_NEED_GENERATION			= -84	-- ˫�����ޱ��趼��һ������
	OR_PET_PROCREATE_NEED_HAPPINESS				= -85	-- ˫�����޿��ֶȱ���Ϊ��ֵ
	OR_PET_PROCREATE_NEED_SEX					= -86	-- ˫�����ޱ���Ϊ����
	OR_PET_PROCREATE_NEED_LEEL_DIFFERENCE		= -87	-- ˫�����޵ȼ������С��5
	OR_PET_PROCREATE_NEED_SPOUSE				= -88	-- ˫�����ޱ�������ż��Ϊ��ż
	OR_PET_PROCREATE_NEED_MONEY					= -89	-- ��Ǯ����
	OR_PET_PROCREATE_NEED_NO_FIGHT_STATE		= -90	-- ˫�����ޱ��趼δ��ս
	OR_PET_PROCREATE_NEED_LIFE					= -91	-- ˫�����������������1000
	OR_PET_PROCREATE_ERROR_REGISTER				= -92	-- ˫������һ�˲�û�������ڴ˷�ֳ
	OR_PET_PROCREATE_NO_FINISHED				= -93	-- ��ֳ��δ���
	OR_PET_PROCREATE_HUMAN_PET_LIST_NO_SPACE	= -94	-- ˫����һ���������б�û���㹻�Ŀռ�
	OR_PET_PROCREATE_NEED_2TEAMMEMBER			= -95	-- ����Ҫ������ɲſ���
	OR_PET_PROCREATE_TEAMMEMBER_TOO_FAR			= -96	-- ��һ����Ա����̫Զ��
	OR_PET_PROCREATE_NEED_LEEL					= -97	-- ����ﵽ��Ӧ�ȼ�
	OR_PET_PROCREATE_NEED_DISTANCE_LEVEL		= -98	-- ����һ�η�ֳ��ʱ�������赽��20
	OR_PET_PROCREATE_NEED_LEADER				= -99	-- �����Ƕӳ����������ֲ���
	OR_CANNOT_TAKE_MOREPET						= -100	-- ���ڲ���Я�����������
	OR_CALLOFHUMAN_NOTSAMESCENE					= -101	-- �㲻����ͨ������Ŀ����㲻��ͬһ����
	OR_DRIDE_INVALID_ACCETP						= -102	-- Ŀ���Ѿ�ȡ���˶��������
	OR_DRIDE_NOT_RIDE_MOUNT						= -103	-- �����߲�û����������
	OR_DRIDE_TARGET_MUST_NOT_RIDE_MOUNT			= -104	-- �������߱���û����������
	OR_DRIDE_TARGET_MUST_IDLE					= -105	-- �������߱���Ϊ����״̬
	OR_DRIDE_OUT_RANGE							= -106	-- ������������ľ���̫Զ
	OR_DRIDE_TARGET_MUST_NOT_CHANGED_MODEL		= -107	-- �������߱��費�ܱ���
	OR_DRIDE_TARGET_MUST_NOT_BY_BUS				= -108;	-- �������߱��費����������
	OR_DRIDE_MUST_NOT_TEAM_FOLLOW				= -109;	-- �����߱��費������Ӹ���״̬
	OR_DRIDE_TARGET_MUST_NOT_TEAM_FOLLOW		= -110;	-- �������߱��費������Ӹ���״̬

	OR_REVENGE_NEED_TARGET_ONLINE				= -120	-- ���Ҳ��������
	OR_REVENGE_NEED_TARGET_LEVEL				= -121	-- �Է��ȼ�̫��
	OR_REVENGE_NOT_TARGET						= -122	-- �㲢û�г�ɱĿ��
	OR_REVENGE_NEED_LEVEL						= -123	-- ����̫Σ�գ��������ʺ���
	OR_REVENGE_NEED_PKVALUE						= -124	-- ��ɱ��̫�أ��������ְ�
	OR_REVENGE_NEED_NO_TARGET					= -125	-- �㻹�����������еĳ�ް�
	OR_REVENGE_NEED_COOLDOWN					= -126	-- ������Ѿ�������̫����
	OR_REVENGE_NEED_UNLOCK_PASSWORD				= -127	-- Σ�ղ��������ȴ򿪶�������
	OR_REVENGE_INVALID_TARGET					= -128	-- �㲻�ܳ�ɱָ��Ŀ��
                                                        --
	OR_CANTDO_DIE								= -130	-- ���Ѿ��������޷�������
	OR_CANTDO_LIMIT_MOVE						= -131	-- ���޷��ƶ�
	OR_CANTDO_TEAM_FOLLOW_LEADER				= -132	-- ����������Ӹ���״̬���޷�������
	OR_CANTDO_TEAM_FOLLOW_MEMBER				= -133	-- ����������Ӹ���״̬���޷�������
	OR_CANTDO_BUS_PASSENGER						= -134	-- �������޷�������
	OR_CANTDO_BUS_CHAUFFEUR						= -135	-- �������޷�������
	OR_CANTDO_MOUNT_PASSENGER					= -136	-- �����������ϣ��޷�������
	OR_CANTDO_MOUNT_CHAUFFEUR					= -137	-- �����������ϣ��޷�������
	OR_CANTDO_FOR_RIDING						= -138	-- ���ʱ�޷��������ֲ���
	OR_CANTDO_TERROR							= -139	-- �־�״̬�޷��������ֲ���
	OR_CANTDO_INSTALL							= -140	-- ��̯״̬�޷��������ֲ���

	OR_PET_COMPOUND_BUSY						= -150	-- �������վ��״̬�²�����
	OR_PET_COMPOUND_CANT_IN_SCENE				= -151	-- ��ս���޲��ܺϳ�
	OR_PET_COMPOUND_NEED_PET_LEVEL				= -152	-- ������޲���30��
	OR_PET_COMPOUND_CANT_VARIANCE				= -153	-- �������޲��ܺϳ�
	OR_PET_COMPOUND_CANT_HAVE_SPOUSE			= -154	-- �ѽ���������޲��ܺϳ�
	OR_PET_PROCREATE_NO_FINISHED				= -155	-- �𼱣����ǵ����޻�δ��ֳ���
	OR_PET_PROCREATE_HUMAN_PET_LIST_NO_SPACE	= -156	-- �Բ��������ϵı����ռ䲻��2��

	OR_PET_NOTYOURPET                           = -157 -- �������Ŀǰ�������㣬���ܲ�׽��

	OR_PET_PROCREATE_QUERY						= -158	-- ��ѯ���޷�ֳ����

	OR_HEALTH_IS_FULL							= -159	-- ����ֵ����
	OR_MANA_IS_FULL								= -160	-- ����ֵ����
	OR_SOMETHING_IN_THE_WAY						= -161; -- �н����������ϰ���
	OR_PVP_MODE_SWITCH_DELAY					= -162;	-- �����������ʮ�����ڲ�����PK�������Զ������ƽģʽ

	OR_DUEL_CAN_NOT_FIND_USER					= -163;	-- ���Ҳ�������һ���Ҳ�����
	OR_DUEL_TARGET_LEVEL_LOW					= -164;	-- �Է��ȼ�̫��
	OR_DUEL_LEVEL_LOW							= -165;	-- ���ĵȼ�̫��, ������Ϊ�������ʺ���
	OR_DUEL_PKVALUE_OVER_LIMIT					= -166; -- ��ɱ��̫�أ��������ְ�
	OR_DUEL_ALREADY_IN_DUEL						= -167; -- ���Ѿ��ں�Ŀ�������
	OR_DUEL_LIST_FULL							= -168; -- ���ľ��������������,�����Ƚ��һЩ��
	OR_DUEL_TARGET_LIST_FULL					= -169; -- Ŀ��ľ����ճ̶���������, �����ǵ�һ�Ȱ�.
	OR_DUEL_BUSY								= -170;	-- �����ں�æ,�Ȼ�������԰�.
	OR_DUEL_TARGET_BUSY							= -171;	-- Ŀ�����ں�æ,�Ȼ�������԰�.
	OR_DUEL_NEED_UNLOCK_PASSWORD				= -172; -- Σ�ղ��������ȴ򿪶�������

	OR_ENEMY_LIST_FULL							= -173; -- ��ս�б�����

	OR_BUS_PASSENGERFULL						= -200;	-- Ŀ�����޿ռ�
	OR_BUS_HASPASSENGER							= -201;	-- ���Ѿ��ڳ�����
	OR_BUS_NOTINBUS								= -202;	-- �㲢���ڳ���
	OR_BUS_RUNNING								= -203;	-- ���Ѿ���վ
	OR_BUS_HASMOUNT								= -204;	-- ���Ѿ�����������
	OR_BUS_HASPET								= -205;	-- ���ﲻ�ܳ���
	OR_BUS_CANNOT_TEAM_FOLLOW					= -206;	-- ��������Ӹ���״̬
	OR_BUS_CANNOT_DRIDE							= -207;	-- ������˫�����״̬
	OR_BUS_CANNOT_CHANGE_MODEL					= -208;	-- �����Ǳ���״̬

	OR_NOTENOUGH_MONEY							= -220; -- �Բ���������Я���Ľ�Ǯ���㡣
	
	DANJIAN_JL30=225	-- 30������
	DANJIAN_JL40=226	-- 40������
	DANJIAN_JL50=227	-- 50������
	DANJIAN_JL60=228	-- 60������
	DANJIAN_JL70=229	-- 70������
	DANJIAN_JL80=230	-- 80������
	DANJIAN_JL90=231	-- 90������
	DANJIAN_JL100=232	-- 100������
	DANJIAN_JL120=233	-- 120������
	DANJIAN_JL149=234	-- 150������

	OR_NO_RIGHT_APPLY_CITY						= -230; -- ��û��Ȩ���������
	OR_GEM_NEED_STUFF							= -237; -- ����뱦ʯ��Ƕ��
	
	OR_EXE_SETPASSWORD							= -258;	-- �����ö����������
	OR_EXE_CHANGEPASSWORD						= -259;	-- ���޸Ķ����������
	OR_EXE_UNLOCKPASSWORD						= -260;	-- �򿪽�������
	OR_PET_PLACARD_AREALDY_HAD_SPOUSE = -261; --�����Ѿ�����ż��
	OR_PLAYERSHOP_SAVEBASEMONEY_SUCCESS			= -262; -- ����̵���뱾��ɹ�....
	OR_PLAYERSHOP_SAVEPROFITMONEY_SUCCESS		= -263; -- ����̵����ӯ���ʽ�ɹ�....
	OR_GEM_EMBED_LACK							= -264;	-- �Բ��𣬴˴�ֻ�ܶ�ǰ�����׽�����Ƕ
	OR_GEM_NO_FOUR_SLOT						= -265;	-- �Բ�������װ��û�е�4���׶����޷����м�����Ƕ
	OR_GEM_ENCHASE_FOUR						= -266;	--�Բ�������װ���Ѿ����й�������Ƕ
	OR_GEM_MUST_ENCHASE_THREE			= -267;	--�Բ��𣬱���ǰ������ȫ����Ƕ�ϱ�ʯ���ܽ��м�����Ƕ
	OR_GEM_NOT_ENCHASE						= -268; --�Բ��𣬴��౦ʯ�޷����м�����Ƕ
	
	
	OR_ERROR_NOSHOW							= -999; -- δ֪���󣬵��ǲ���ʾ�˴���

--ʹ��StoreMap ��������
	USEITEM_SUCCESS			=	0
	USEITEM_CANNT_USE		=	1
	USEITEM_LEVEL_FAIL		=	2
	USEITEM_TYPE_FAIL		=	3
	USEITEM_SKILL_FAIL		=	4
	USEITEM_INVALID			=	5

--����ܵ�ʦ��ر���
ABILITY_TEACHER_SHOP = 11	--��ʦ�򹤾��̵�
ABILITY_STUDY = 0			--ѧϰ����
ABILITY_STUDY_OK = 2		--ѧϰ����ȷ��
ABILITY_STUDY_CANCEL = 3	--ѧϰ����ȡ��
ABILITY_DIALOG = {21,22,23,24,25}	--����˵���Ի�

--��������������ر���
REFIX_ATTACK_COLD = 21
REFIX_ATTACK_FIRE = 23
REFIX_ATTACK_LIGHT = 25
REFIX_ATTACK_POISON = 27

--����npc��������
PET_FULL	=	40		--�����޻ָ�Ѫ�Ϳ��ֶȵ��¼�(���ǽű�ID)
PET_FULL_OK	=	41		--ȷ�ϸ����޻ָ�Ѫ�Ϳ��ֶȵ��¼�(���ǽű�ID)

--��Ǯ��ʾת���ű��ı��
MONEY_DISPLAY_SCRIPT_ID = 701604

SHIMEN_MISSION_SCRIPT_ID = 229000

--��������ֲ��־��0 û����  1����һ��ׯ��δ����		2����δ����  3����δ����  4 �Ŀ�δ����
--����36��,����36��,����36��������2 36��������3 36����¥��10����˳���Ǵ������������ݣ�����2������3��¥��
PLANTFLAG = {0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,
						 0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,
				 0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,
							0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,
					0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 --¥����ʼ��20����־
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 --���� 7 zchw
			 0,0,0,0,0,0,0,
	}

--��ֲ����������
--����36��,����36��,����36��������2 36��������3 36����˳���Ǵ������������ݣ�����2������3
PLANTNPC_ADDRESS ={
					{X=116,Z=167,Scene=2,X_MIN=114,X_MAX=118,Z_MIN=165,Z_MAX=169},
					{X=123,Z=167,Scene=2,X_MIN=121,X_MAX=125,Z_MIN=165,Z_MAX=169},
					{X=130,Z=167,Scene=2,X_MIN=128,X_MAX=132,Z_MIN=165,Z_MAX=169},
					{X=116,Z=177,Scene=2,X_MIN=114,X_MAX=118,Z_MIN=175,Z_MAX=179},
					{X=123,Z=177,Scene=2,X_MIN=121,X_MAX=125,Z_MIN=175,Z_MAX=179},
					{X=130,Z=177,Scene=2,X_MIN=128,X_MAX=132,Z_MIN=175,Z_MAX=179},
					{X=116,Z=186,Scene=2,X_MIN=114,X_MAX=118,Z_MIN=184,Z_MAX=188},
					{X=123,Z=186,Scene=2,X_MIN=121,X_MAX=125,Z_MIN=184,Z_MAX=188},
					{X=130,Z=186,Scene=2,X_MIN=128,X_MAX=132,Z_MIN=184,Z_MAX=188},
					{X=90,Z=295,Scene=2,X_MIN=88,X_MAX=92,Z_MIN=293,Z_MAX=297},
					{X=100,Z=295,Scene=2,X_MIN=98,X_MAX=102,Z_MIN=293,Z_MAX=297},
						{X=100,Z=303,Scene=2,X_MIN=98,X_MAX=102,Z_MIN=301,Z_MAX=305},
						{X=222,Z=428,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=426,Z_MAX=430},
						{X=227,Z=428,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=426,Z_MAX=430},
						{X=233,Z=428,Scene=2,X_MIN=231,X_MAX=235,Z_MIN=426,Z_MAX=430},
						{X=239,Z=428,Scene=2,X_MIN=237,X_MAX=241,Z_MIN=426,Z_MAX=430},
						{X=245,Z=428,Scene=2,X_MIN=243,X_MAX=247,Z_MIN=426,Z_MAX=430},
						{X=251,Z=428,Scene=2,X_MIN=249,X_MAX=253,Z_MIN=426,Z_MAX=430},
						{X=222,Z=435,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=433,Z_MAX=437},
						{X=227,Z=435,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=433,Z_MAX=437},
						{X=222,Z=442,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=440,Z_MAX=444},
						{X=227,Z=442,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=440,Z_MAX=444},
						{X=227,Z=449,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=447,Z_MAX=451},
					{X=222,Z=449,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=447,Z_MAX=451},
					{X=335,Z=428,Scene=2,X_MIN=333,X_MAX=337,Z_MIN=426,Z_MAX=430},
					{X=343,Z=428,Scene=2,X_MIN=341,X_MAX=345,Z_MIN=426,Z_MAX=430},
					{X=350,Z=428,Scene=2,X_MIN=348,X_MAX=352,Z_MIN=426,Z_MAX=430},
					{X=337,Z=439,Scene=2,X_MIN=335,X_MAX=339,Z_MIN=437,Z_MAX=441},
					{X=343,Z=439,Scene=2,X_MIN=341,X_MAX=345,Z_MIN=437,Z_MAX=441},
					{X=349,Z=439,Scene=2,X_MIN=347,X_MAX=351,Z_MIN=437,Z_MAX=441},
					{X=431,Z=293,Scene=2,X_MIN=429,X_MAX=433,Z_MIN=291,Z_MAX=295},
					{X=437,Z=293,Scene=2,X_MIN=435,X_MAX=439,Z_MIN=291,Z_MAX=295},
					{X=431,Z=302,Scene=2,X_MIN=429,X_MAX=433,Z_MIN=300,Z_MAX=304},
					{X=439,Z=302,Scene=2,X_MIN=437,X_MAX=441,Z_MIN=300,Z_MAX=304},
					{X=431,Z=311,Scene=2,X_MIN=429,X_MAX=433,Z_MIN=309,Z_MAX=313},
					{X=437,Z=311,Scene=2,X_MIN=435,X_MAX=439,Z_MIN=309,Z_MAX=313},
						{X=137,Z=310,Scene=0,X_MIN=135,X_MAX=139,Z_MIN=308,Z_MAX=312},
						{X=144,Z=310,Scene=0,X_MIN=142,X_MAX=146,Z_MIN=308,Z_MAX=312},
						{X=152,Z=310,Scene=0,X_MIN=150,X_MAX=154,Z_MIN=308,Z_MAX=312},
						{X=159,Z=310,Scene=0,X_MIN=157,X_MAX=161,Z_MIN=308,Z_MAX=312},
						{X=137,Z=319,Scene=0,X_MIN=135,X_MAX=139,Z_MIN=317,Z_MAX=321},
						{X=144,Z=319,Scene=0,X_MIN=142,X_MAX=146,Z_MIN=317,Z_MAX=321},
						{X=152,Z=319,Scene=0,X_MIN=150,X_MAX=154,Z_MIN=317,Z_MAX=321},
						{X=159,Z=319,Scene=0,X_MIN=157,X_MAX=161,Z_MIN=317,Z_MAX=321},
						{X=140,Z=328,Scene=0,X_MIN=138,X_MAX=142,Z_MIN=326,Z_MAX=330},
						{X=147,Z=328,Scene=0,X_MIN=145,X_MAX=149,Z_MIN=326,Z_MAX=330},
						{X=153,Z=328,Scene=0,X_MIN=151,X_MAX=155,Z_MIN=326,Z_MAX=330},
						{X=147,Z=337,Scene=0,X_MIN=145,X_MAX=149,Z_MIN=335,Z_MAX=339},
					{X=174,Z=390,Scene=0,X_MIN=172,X_MAX=176,Z_MIN=388,Z_MAX=392},
					{X=174,Z=398,Scene=0,X_MIN=172,X_MAX=176,Z_MIN=396,Z_MAX=400},
					{X=179,Z=390,Scene=0,X_MIN=177,X_MAX=181,Z_MIN=388,Z_MAX=392},
					{X=179,Z=398,Scene=0,X_MIN=177,X_MAX=181,Z_MIN=396,Z_MAX=400},
					{X=185,Z=390,Scene=0,X_MIN=183,X_MAX=187,Z_MIN=388,Z_MAX=392},
					{X=185,Z=398,Scene=0,X_MIN=183,X_MAX=187,Z_MIN=396,Z_MAX=400},
					{X=190,Z=390,Scene=0,X_MIN=188,X_MAX=192,Z_MIN=388,Z_MAX=392},
					{X=190,Z=398,Scene=0,X_MIN=188,X_MAX=192,Z_MIN=396,Z_MAX=400},
					{X=197,Z=390,Scene=0,X_MIN=195,X_MAX=199,Z_MIN=388,Z_MAX=392},
					{X=197,Z=399,Scene=0,X_MIN=195,X_MAX=199,Z_MIN=397,Z_MAX=401},
					{X=323,Z=390,Scene=0,X_MIN=321,X_MAX=325,Z_MIN=388,Z_MAX=392},
					{X=332,Z=390,Scene=0,X_MIN=330,X_MAX=334,Z_MIN=388,Z_MAX=392},
						{X=365,Z=302,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=300,Z_MAX=304},
						{X=372,Z=302,Scene=0,X_MIN=370,X_MAX=374,Z_MIN=300,Z_MAX=304},
						{X=372,Z=310,Scene=0,X_MIN=370,X_MAX=374,Z_MIN=308,Z_MAX=312},
						{X=365,Z=310,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=308,Z_MAX=312},
						{X=358,Z=310,Scene=0,X_MIN=356,X_MAX=360,Z_MIN=308,Z_MAX=312},
						{X=351,Z=310,Scene=0,X_MIN=349,X_MAX=353,Z_MIN=308,Z_MAX=312},
						{X=351,Z=318,Scene=0,X_MIN=349,X_MAX=353,Z_MIN=316,Z_MAX=320},
						{X=358,Z=318,Scene=0,X_MIN=356,X_MAX=360,Z_MIN=316,Z_MAX=320},
						{X=365,Z=318,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=316,Z_MAX=320},
						{X=372,Z=318,Scene=0,X_MIN=370,X_MAX=374,Z_MIN=316,Z_MAX=320},
						{X=358,Z=327,Scene=0,X_MIN=356,X_MAX=360,Z_MIN=325,Z_MAX=329},
						{X=365,Z=327,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=325,Z_MAX=329},
							{X=214,Z=115,Scene=1,X_MIN=212,X_MAX=216,Z_MIN=113,Z_MAX=117},
							{X=213,Z=124,Scene=1,X_MIN=211,X_MAX=215,Z_MIN=122,Z_MAX=126},
							{X=223,Z=115,Scene=1,X_MIN=221,X_MAX=225,Z_MIN=113,Z_MAX=117},
							{X=223,Z=124,Scene=1,X_MIN=221,X_MAX=225,Z_MIN=122,Z_MAX=126},
							{X=232,Z=114,Scene=1,X_MIN=231,X_MAX=234,Z_MIN=112,Z_MAX=116},
							{X=231,Z=123,Scene=1,X_MIN=229,X_MAX=233,Z_MIN=121,Z_MAX=125},
							{X=241,Z=112,Scene=1,X_MIN=239,X_MAX=243,Z_MIN=110,Z_MAX=114},
							{X=242,Z=120,Scene=1,X_MIN=240,X_MAX=244,Z_MIN=118,Z_MAX=122},
							{X=305,Z=105,Scene=1,X_MIN=303,X_MAX=307,Z_MIN=103,Z_MAX=107},
							{X=303,Z=116,Scene=1,X_MIN=301,X_MAX=305,Z_MIN=114,Z_MAX=118},
							{X=313,Z=105,Scene=1,X_MIN=311,X_MAX=315,Z_MIN=103,Z_MAX=107},
							{X=313,Z=117,Scene=1,X_MIN=311,X_MAX=315,Z_MIN=115,Z_MAX=119},
						{X=322,Z=107,Scene=1,X_MIN=320,X_MAX=324,Z_MIN=105,Z_MAX=109},
						{X=321,Z=119,Scene=1,X_MIN=319,X_MAX=323,Z_MIN=117,Z_MAX=121},
						{X=330,Z=112,Scene=1,X_MIN=328,X_MAX=332,Z_MIN=110,Z_MAX=114},
						{X=331,Z=124,Scene=1,X_MIN=329,X_MAX=333,Z_MIN=122,Z_MAX=126},
						{X=109,Z=192,Scene=1,X_MIN=107,X_MAX=111,Z_MIN=190,Z_MAX=194},
						{X=108,Z=202,Scene=1,X_MIN=106,X_MAX=110,Z_MIN=200,Z_MAX=204},
						{X=101,Z=202,Scene=1,X_MIN=99,X_MAX=103,Z_MIN=200,Z_MAX=204},
						{X=102,Z=213,Scene=1,X_MIN=100,X_MAX=104,Z_MIN=211,Z_MAX=215},
						{X=108,Z=214,Scene=1,X_MIN=106,X_MAX=110,Z_MIN=212,Z_MAX=216},
						{X=129,Z=204,Scene=1,X_MIN=127,X_MAX=131,Z_MIN=202,Z_MAX=206},
						{X=135,Z=212,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=210,Z_MAX=214},
						{X=135,Z=222,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=220,Z_MAX=224},
							{X=127,Z=223,Scene=1,X_MIN=125,X_MAX=129,Z_MIN=221,Z_MAX=225},
							{X=125,Z=232,Scene=1,X_MIN=123,X_MAX=127,Z_MIN=230,Z_MAX=234},
							{X=135,Z=232,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=230,Z_MAX=234},
							{X=126,Z=243,Scene=1,X_MIN=124,X_MAX=128,Z_MIN=241,Z_MAX=245},
							{X=135,Z=243,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=241,Z_MAX=245},
							{X=308,Z=374,Scene=1,X_MIN=306,X_MAX=310,Z_MIN=372,Z_MAX=376},
							{X=318,Z=365,Scene=1,X_MIN=316,X_MAX=320,Z_MIN=363,Z_MAX=367},
							{X=317,Z=374,Scene=1,X_MIN=315,X_MAX=319,Z_MIN=372,Z_MAX=376},
							{X=327,Z=366,Scene=1,X_MIN=325,X_MAX=329,Z_MIN=364,Z_MAX=368},
							{X=327,Z=375,Scene=1,X_MIN=325,X_MAX=329,Z_MIN=373,Z_MAX=377},
							{X=336,Z=367,Scene=1,X_MIN=334,X_MAX=338,Z_MIN=365,Z_MAX=369},
							{X=336,Z=375,Scene=1,X_MIN=334,X_MAX=338,Z_MIN=373,Z_MAX=377},
					{X=37,Z=93,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=90,Z_MAX=96},
					{X=46,Z=93,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=90,Z_MAX=96},
					{X=37,Z=101,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=98,Z_MAX=104},
					{X=46,Z=101,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=98,Z_MAX=104},
					{X=38,Z=109,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=106,Z_MAX=112},
					{X=46,Z=109,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=106,Z_MAX=112},
					{X=37,Z=117,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=114,Z_MAX=120},
					{X=46,Z=117,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=114,Z_MAX=120},
					{X=38,Z=125,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=122,Z_MAX=128},
					{X=46,Z=125,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=122,Z_MAX=128},
					{X=38,Z=134,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=131,Z_MAX=137},
					{X=46,Z=134,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=131,Z_MAX=138},
						{X=264,Z=175,Scene=71,X_MIN=262,X_MAX=266,Z_MIN=172,Z_MAX=178},
						{X=270,Z=175,Scene=71,X_MIN=268,X_MAX=272,Z_MIN=172,Z_MAX=178},
						{X=277,Z=175,Scene=71,X_MIN=275,X_MAX=279,Z_MIN=173,Z_MAX=178},
						{X=287,Z=175,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=172,Z_MAX=178},
						{X=270,Z=183,Scene=71,X_MIN=268,X_MAX=272,Z_MIN=180,Z_MAX=186},
						{X=277,Z=183,Scene=71,X_MIN=275,X_MAX=279,Z_MIN=180,Z_MAX=186},
						{X=287,Z=183,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=180,Z_MAX=186},
						{X=270,Z=192,Scene=71,X_MIN=268,X_MAX=272,Z_MIN=189,Z_MAX=195},
						{X=277,Z=192,Scene=71,X_MIN=275,X_MAX=279,Z_MIN=189,Z_MAX=195},
						{X=287,Z=192,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=189,Z_MAX=195},
						{X=287,Z=200,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=197,Z_MAX=203},
						{X=287,Z=209,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=206,Z_MAX=212},
					{X=134,Z=272,Scene=71,X_MIN=132,X_MAX=136,Z_MIN=269,Z_MAX=274},
					{X=141,Z=272,Scene=71,X_MIN=139,X_MAX=143,Z_MIN=269,Z_MAX=274},
					{X=148,Z=272,Scene=71,X_MIN=146,X_MAX=150,Z_MIN=269,Z_MAX=275},
					{X=173,Z=271,Scene=71,X_MIN=171,X_MAX=175,Z_MIN=268,Z_MAX=274},
					{X=181,Z=271,Scene=71,X_MIN=179,X_MAX=183,Z_MIN=268,Z_MAX=274},
					{X=188,Z=271,Scene=71,X_MIN=186,X_MAX=190,Z_MIN=268,Z_MAX=273},
					{X=134,Z=279,Scene=71,X_MIN=132,X_MAX=136,Z_MIN=276,Z_MAX=281},
					{X=141,Z=279,Scene=71,X_MIN=139,X_MAX=143,Z_MIN=276,Z_MAX=281},
					{X=148,Z=279,Scene=71,X_MIN=146,X_MAX=150,Z_MIN=276,Z_MAX=282},
					{X=173,Z=279,Scene=71,X_MIN=171,X_MAX=175,Z_MIN=276,Z_MAX=281},
					{X=181,Z=279,Scene=71,X_MIN=179,X_MAX=183,Z_MIN=276,Z_MAX=281},
					{X=188,Z=279,Scene=71,X_MIN=186,X_MAX=190,Z_MIN=276,Z_MAX=281},
							{X=37,Z=93,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=90,Z_MAX=96},
							{X=46,Z=93,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=90,Z_MAX=96},
							{X=37,Z=101,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=98,Z_MAX=104},
							{X=46,Z=101,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=98,Z_MAX=104},
							{X=38,Z=109,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=106,Z_MAX=112},
							{X=46,Z=109,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=106,Z_MAX=112},
							{X=37,Z=117,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=114,Z_MAX=120},
							{X=46,Z=117,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=114,Z_MAX=120},
							{X=38,Z=125,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=122,Z_MAX=128},
							{X=46,Z=125,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=122,Z_MAX=128},
							{X=38,Z=134,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=131,Z_MAX=137},
							{X=46,Z=134,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=131,Z_MAX=138},
					{X=264,Z=175,Scene=72,X_MIN=262,X_MAX=266,Z_MIN=172,Z_MAX=178},
					{X=270,Z=175,Scene=72,X_MIN=268,X_MAX=272,Z_MIN=172,Z_MAX=178},
					{X=277,Z=175,Scene=72,X_MIN=275,X_MAX=279,Z_MIN=173,Z_MAX=178},
					{X=287,Z=175,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=172,Z_MAX=178},
					{X=270,Z=183,Scene=72,X_MIN=268,X_MAX=272,Z_MIN=180,Z_MAX=186},
					{X=277,Z=183,Scene=72,X_MIN=275,X_MAX=279,Z_MIN=180,Z_MAX=186},
					{X=287,Z=183,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=180,Z_MAX=186},
					{X=270,Z=192,Scene=72,X_MIN=268,X_MAX=272,Z_MIN=189,Z_MAX=195},
					{X=277,Z=192,Scene=72,X_MIN=275,X_MAX=279,Z_MIN=189,Z_MAX=195},
					{X=287,Z=192,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=189,Z_MAX=195},
					{X=287,Z=200,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=197,Z_MAX=203},
					{X=287,Z=209,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=206,Z_MAX=212},
						{X=134,Z=272,Scene=72,X_MIN=132,X_MAX=136,Z_MIN=269,Z_MAX=274},
						{X=141,Z=272,Scene=72,X_MIN=139,X_MAX=143,Z_MIN=269,Z_MAX=274},
						{X=148,Z=272,Scene=72,X_MIN=146,X_MAX=150,Z_MIN=269,Z_MAX=275},
						{X=173,Z=271,Scene=72,X_MIN=171,X_MAX=175,Z_MIN=268,Z_MAX=274},
						{X=181,Z=271,Scene=72,X_MIN=179,X_MAX=183,Z_MIN=268,Z_MAX=274},
						{X=188,Z=271,Scene=72,X_MIN=186,X_MAX=190,Z_MIN=268,Z_MAX=273},
						{X=134,Z=279,Scene=72,X_MIN=132,X_MAX=136,Z_MIN=276,Z_MAX=281},
						{X=141,Z=279,Scene=72,X_MIN=139,X_MAX=143,Z_MIN=276,Z_MAX=281},
						{X=148,Z=279,Scene=72,X_MIN=146,X_MAX=150,Z_MIN=276,Z_MAX=282},
						{X=173,Z=279,Scene=72,X_MIN=171,X_MAX=175,Z_MIN=276,Z_MAX=281},
						{X=181,Z=279,Scene=72,X_MIN=179,X_MAX=183,Z_MIN=276,Z_MAX=281},
						{X=188,Z=279,Scene=72,X_MIN=186,X_MAX=190,Z_MIN=276,Z_MAX=281},
					-- ¥����ֲ��
					{X=35,Z=206,Scene=186,X_MIN=33,X_MAX=37,Z_MIN=203,Z_MAX=208},
					{X=41,Z=206,Scene=186,X_MIN=39,X_MAX=43,Z_MIN=203,Z_MAX=208},
					{X=46,Z=206,Scene=186,X_MIN=43,X_MAX=47,Z_MIN=203,Z_MAX=208},
					{X=51,Z=206,Scene=186,X_MIN=48,X_MAX=52,Z_MIN=203,Z_MAX=208},
					{X=57,Z=206,Scene=186,X_MIN=54,X_MAX=58,Z_MIN=203,Z_MAX=208},
					{X=57,Z=214,Scene=186,X_MIN=55,X_MAX=59,Z_MIN=211,Z_MAX=216},
					{X=51,Z=214,Scene=186,X_MIN=49,X_MAX=53,Z_MIN=211,Z_MAX=216},
					{X=46,Z=214,Scene=186,X_MIN=44,X_MAX=48,Z_MIN=211,Z_MAX=216},
					{X=41,Z=214,Scene=186,X_MIN=39,X_MAX=43,Z_MIN=211,Z_MAX=216},
					{X=35,Z=214,Scene=186,X_MIN=33,X_MAX=37,Z_MIN=211,Z_MAX=216},
					--¥���¿�10���
					{X=97,Z=197,Scene=186,X_MIN=95,X_MAX=99,Z_MIN=194,Z_MAX=199},
					{X=104,Z=197,Scene=186,X_MIN=102,X_MAX=106,Z_MIN=194,Z_MAX=199},
					{X=97,Z=206,Scene=186,X_MIN=95,X_MAX=99,Z_MIN=203,Z_MAX=208},
					{X=103,Z=206,Scene=186,X_MIN=101,X_MAX=105,Z_MIN=203,Z_MAX=208},
					{X=109,Z=206,Scene=186,X_MIN=107,X_MAX=121,Z_MIN=203,Z_MAX=208},
					{X=96,Z=216,Scene=186,X_MIN=94,X_MAX=98,Z_MIN=213,Z_MAX=218},
					{X=102,Z=216,Scene=186,X_MIN=100,X_MAX=104,Z_MIN=213,Z_MAX=218},
					{X=108,Z=216,Scene=186,X_MIN=106,X_MAX=110,Z_MIN=213,Z_MAX=218},
					{X=96,Z=234,Scene=186,X_MIN=94,X_MAX=98,Z_MIN=231,Z_MAX=236},
					{X=102,Z=234,Scene=186,X_MIN=100,X_MAX=104,Z_MIN=231,Z_MAX=236},
						--���ӹ�����ֲ�� zchw
					{X=288,Z= 284,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=283,Z_MAX=287},
  				{X=288,Z= 276,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=275,Z_MAX=279},
  				{X=288,Z= 268,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=267,Z_MAX=271},
 				 	{X=288,Z= 259,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=258,Z_MAX=262},
  				{X=296,Z= 258,Scene=420,X_MIN=295,X_MAX=298,Z_MIN=257,Z_MAX=261},
  				{X=296,Z= 267,Scene=420,X_MIN=295,X_MAX=298,Z_MIN=266,Z_MAX=270},
  				{X=296,Z= 276,Scene=420,X_MIN=295,X_MAX=298,Z_MIN=275,Z_MAX=279}, 
				}
--��ֲ��Ʒ��commonitem�еı��
V_ZHONGZHI_ID = {20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010,
				20104011,20104012,20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,
				20105009,20105010,20105011,20105012}
--��ֲ��Ʒ�ĵȼ�
V_ZHONGZHI_NEEDLEVEL = {1,2,3,4,5,6,7,8,9,10,
						11,12,1,2,3,4,5,6,7,8,
						9,10,11,12}
--��ֲ��Ʒ������
V_ZHONGZHI_NAME = {"���С��","�������","�������","�������","�������","�������","���֥��","����̶�","����ƶ�","����϶�",
					"���������","�����ͷ","�������","�������","�������","���ľ��","�������","�������","�������","�������",
					"�������","�������","����޲���","���½����",
					"���С��","�������","�������","�������","�������","�������","���֥��","����̶�","����ƶ�","����϶�",
					"���������","�����ͷ","�������","�������","�������","���ľ��","�������","�������","�������","�������",
					"�������","�������","����޲���","���½����"}
--��ֲʱ�����������������growpoint.txt�еı��
V_ZHONGZHI_ITEMBOX_ID = {501,504,507,510,513,516,519,522,525,528,
					531,534,537,540,543,546,549,552,555,558,
					561,564,567,570,
					701,704,707,710,713,716,719,722,725,728,
					731,734,737,740,743,746,749,752,755,758,
					761,764,767,770}

--randomseed(mytime());

--����ID�ź궨��
MP_SHAOLIN  = 0
MP_MINGJIAO = 1
MP_GAIBANG  = 2
MP_WUDANG   = 3
MP_EMEI     = 4
MP_XINGSU   = 5
MP_DALI     = 6
MP_TIANSHAN = 7
MP_XIAOYAO  = 8
MP_WUMENPAI = 9

--���ɵ�ʦ�Žű�ID....
MENPAI_SHIMEN_SCRIPTID = {
	229000,
	229001,
	229008,
	229002,
	229003,
	229007,
	229004,
	229006,
	229005,
}

--���ɵ�ʦ�������....
MENPAI_SHIMEN_MISID = {
	1060,
	1070,
	1065,
	1075,
	1090,
	1095,
	1080,
	1100,
	1085,
}


--���������궨��
SCENE_NUMBER  = 42

--�������ƺ궨��
SCENE_NAME ={ "����", "����", "����", "��ɽ", "̫��", "����", "����ɽ","����","�ػ�","������","ؤ���ܶ�","������","�䵱ɽ", "������", "�R����", "����ɽ", "���޺�", "��ɽ", "����", "�㱱", "��ԭ", "����", "����ɽ", "������", "��ɽ", "����", "ʯ��", "��Ϫ", "��گ", "�置", "����", "��Ȫ", "����", "÷��", "�Ϻ�", "����", "����ׯ", "������", "һƷ��", "Ԥ��1", "Ԥ��2", "Ԥ��3"}

--*******************************************************************************
--��������׬Ǯ����Ŀ��npc�ĳ�����,����,��Ӧ����ű�,����
--*******************************************************************************
MISSION_LUOYANG_SENDMAIL ={{X=216,Z=135,SCENE=0,SCRIPT=250501,TIP="�ϰٲ�"},
							{X=138,Z=164,SCENE=2,SCRIPT=250502,TIP="������"}
						}

MISSION_4006=4006
MISSION_4007=4007
MISSION_4008=4008
MISSION_4009=4009
MISSION_4013=4013
MISSION_4022=4022
MISSION_4028=4028
MISSION_546=546
MISSION_564=564
MISSION_561=561

--*******************************************************************************
--����Msg2player�����һ������,��ʾ���촰�ڵ���ʾ����ǰû�б������
--*******************************************************************************
MSG2PLAYER_PARA=8

--*******************************************************************************
--��ִ���ʼ� param0 �Ŀ���ֵ
--*******************************************************************************
MAIL_REPUDIATE				= 1			--ǿ�����
MAIL_BETRAYMASTER			= 2			--��ʦ
MAIL_EXPELPRENTICE			= 3			--����ͽ��
MAIL_UPDATE_ATTR			= 4			--����ˢ��
MAIL_UNSWEAR				= 5			--������
MAIL_PRENTICE_EXP			= 6			--ͽ�ܸ�ʦ������
MAIL_COMMISIONSHOP			= 7			--�����̵��ʼ�
MAIL_HUASHANJIANGLI			=	8			--��ɽ�۽��������
MAIL_SHITUPRIZE				= 9				--ͽ�ܸ�ʦ���齱����
MAIL_SHITUPRIZE_GOODBAD = 10		--����������ƶ�ֵ
MIAL_SHITU_CHUSHI		= 11				--45����ʦ 
MAIL_FINDFRIEND_DELINFO = 12        --����ϵͳ�������������ϵͳ��������ҷ�������Ϣ

--*******************************************************************************
--�䷽�ú궨��
--*******************************************************************************
USERECIPE_SCRIPT	= 713501			--ʹ���䷽�Ľű����

--*******************************************************************************
--�����
--*******************************************************************************

ABILITY_PENGREN	= 1		--��⿼��ܶ�Ӧ���
ABILITY_ZHIYAO	= 2		--��ҩ���ܶ�Ӧ���
ABILITY_XIANGQIAN	= 3		--��Ƕ���ܶ�Ӧ���
ABILITY_ZHUZAO= 4		--���켼�ܶ�Ӧ���
ABILITY_FENGREN	= 5		--���Ҽ��ܶ�Ӧ���
ABILITY_GONGYI	= 6		--�����������ܶ�Ӧ���
ABILITY_CAIKUANG	= 7		--�ɿ��ܶ�Ӧ���
ABILITY_CAIYAO	= 8		--��ҩ���ܶ�Ӧ���
ABILITY_DIAOYU	= 9		--���㼼�ܶ�Ӧ���
ABILITY_ZHONGZHI	= 10		--��ֲ���ܶ�Ӧ���
ABILITY_KAIGUANG	= 11		--���⼼�ܶ�Ӧ���
ABILITY_SHENGHUOSHU	= 12		--ʥ�������ܶ�Ӧ���
ABILITY_NIANGJIU	= 13		--��Ƽ��ܶ�Ӧ���
ABILITY_XUANBINGSHU	= 14		--���������ܶ�Ӧ���
ABILITY_ZHIGU	= 15		--�ƹƼ��ܶ�Ӧ���
ABILITY_ZHIDU	= 16		--�ƶ����ܶ�Ӧ���
ABILITY_ZHIFU	= 17		--�Ʒ����ܶ�Ӧ���
ABILITY_LIANDAN	= 18		--�������ܶ�Ӧ���
ABILITY_QIMENDUNJIA	= 19		--���Ŷݼ׼��ܶ�Ӧ���
ABILITY_GONGCHENGXUE	= 20		--����ѧ���ܶ�Ӧ���
ABILITY_QUGUI	= 21		--�����ܶ�Ӧ���
ABILITY_WABAO	= 22		--�ڱ����ܶ�Ӧ���
ABILITY_PAOSHANG	= 23		--���̼��ܶ�Ӧ���
ABILITY_SHAJIA	= 24		--ɱ�ۼ��ܶ�Ӧ���
ABILITY_REMAI	= 25		--�������ܶ�Ӧ���
ABILITY_CAOZUOZHONG	= 26		--�����м��ܶ�Ӧ���
ABILITY_YAOLI = 27		--ҩ���ܶ�Ӧ���
ABILITY_YANGSHENGFA = 28 --������
ABILITY_FOFA = 29	--��					���� ���ڸ���	����
ABILITY_CAIHUOSHU = 30	--�ɻ���			���� ���ڸ���	ʥ����
ABILITY_LIANHUALUO = 31	--������			ؤ�� ���ڸ���	���
ABILITY_CAIBINGSHU = 32	--�ɱ���			��ɽ ���ڸ���	������
ABILITY_JINGMAIBAIJUE = 33	--�����پ�		���� ���ڸ���	�ƹ�
ABILITY_YINCHONGSHU = 34	--������		���� ���ڸ���	�ƶ�
ABILITY_LINGXINSHU = 35	--������			���� ���ڸ���	�Ʒ�
ABILITY_DAOFA = 36	--����					�䵱 ���ڸ���	����
ABILITY_LIUYIFENGGU = 37	--���շ��		��ң ���ڸ���	���Ŷݼ�
ABILITY_QISHU	= 38	--����
ABILITY_GPS	= 39	--��λ��
ABILITY_HUOXUE	= 40	--��Ѫ
ABILITY_YANGQI	= 41	--����
ABILITY_QIANGSHEN	=	42	--ǿ��
ABILITY_JIANTI	=	43	--����
ABILITY_XIUSHEN	=	44	--����
ABILITY_SUTI	=	45	--����
ABILITY_CAILIAOHECHENG = 49	--���Ϻϳ�	���Ϻϳ�

--*******************************************************************************
--�����������ϸ��Ϣ������ܵ����ƣ�����ܵĽű��ţ���Ӧ�ĺ�������
--yangjun ��Ҫ��Ϊ�˼������еľ�����ܽű������ڵ�
--*******************************************************************************
--�±�			�����ID
--aname			�������ܵ�����
--script		�������ܵĽű���(ѧϰ,����,�˽�)

CITY_ABILITY_DETAIL	=	{
	--�������
	[ABILITY_HUOXUE]	=	{aname="��Ѫ",script={713622,713622,713622}},
	[ABILITY_YANGQI]	=	{aname="����",script={713623,713623,713623}},
	[ABILITY_QIANGSHEN]	=	{aname="ǿ��",script={713624,713624,713624}},
	[ABILITY_JIANTI]	=	{aname="����",script={713625,713625,713625}},
	[ABILITY_XIUSHEN]	=	{aname="����",script={713626,713626,713626}},
	[ABILITY_SUTI]		=	{aname="����",script={713627,713627,713627}},
	--ԭ�����е������
	[ABILITY_ZHUZAO]	=	{aname="����",script={713505,713564,713604}},
	[ABILITY_FENGREN]	=	{aname="����",script={713506,713565,713605}},
	[ABILITY_CAIKUANG]	=	{aname="�ɿ�",script={713508,713567,713607}},
	[ABILITY_GONGYI]	=	{aname="����",script={713507,713566,713606}},
	--[ABILITY_XIANGQIAN]	=	{aname="��Ƕ",script={713504,713563,713603}},
	[ABILITY_ZHONGZHI]	=	{aname="��ֲ",script={713511,713570,713610}},
	[ABILITY_CAIYAO]	=	{aname="��ҩ",script={713509,713568,713608}},
	[ABILITY_DIAOYU]	=	{aname="����",script={713510,713569,713609}},
--	[ABILITY_PAOSHANG]	=	{aname="����",script={,,}},
--	[ABILITY_GONGCHENGXUE]	=	{aname="����ѧ",script={,,}},
	[ABILITY_PENGREN]	=	{aname="���",script={-1,713561,713601}},
	[ABILITY_YANGSHENGFA]	=	{aname="����",script={713528,713587,713621}},
	[ABILITY_ZHIYAO]	=	{aname="��ҩ",script={713503,713562,713602}},
	[ABILITY_YAOLI]	=	{aname="ҩ��",script={713527,713586,713620}},
}

--*******************************************************************************
--���н��������
--*******************************************************************************
CITY_BUILDING_XIANYA			= 0			--����0
CITY_BUILDING_XIANGFANG		= 1     --�᷿1
CITY_BUILDING_JIUSI				= 2     --����2
CITY_BUILDING_QIANZHUANG	= 3     --Ǯׯ3
CITY_BUILDING_FANGJUFANG	= 4     --����4
CITY_BUILDING_DUANTAI			= 5     --��̨5
CITY_BUILDING_WUJUFANG		= 6     --���6
CITY_BUILDING_MICANG			= 7     --�ײ�7
CITY_BUILDING_CHENGQIANG	= 8     --��ǽ8
CITY_BUILDING_JIFANG			= 9     --����9
CITY_BUILDING_YISHE				= 10    --ҽ��10
CITY_BUILDING_WUFANG			= 11    --���11
CITY_BUILDING_JIANTA			= 12    --����12
CITY_BUILDING_SHUFANG			= 13    --�鷿13
CITY_BUILDING_QIJI				= 14    --�漣14
CITY_BUILDING_XIAOCHANG		= 15    --У��15
CITY_BUILDING_HUOBINGTA		= 16    --�����16
CITY_BUILDING_DAQI				= 17    --����17

CITY_IND_RATE		= 0		--��ҵ��0
CITY_AGR_RATE		=	1   --ũҵ��1
CITY_COM_RATE		=	2   --��ҵ��2
CITY_DEF_RATE		=	3   --������3
CITY_TECH_RATE	=	4   --�Ƽ���4
CITY_AMBI_RATE	=	5   --������5

--*******************************************************************************
--���н����Ｐ����ֵ��Ӧ��
--*******************************************************************************
CITY_BUILDING_SIXRATE = {
					[CITY_BUILDING_XIANYA]			= CITY_AMBI_RATE,
					[CITY_BUILDING_XIANGFANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_JIUSI]       = CITY_AMBI_RATE,
					[CITY_BUILDING_QIANZHUANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_FANGJUFANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_DUANTAI]     = CITY_AMBI_RATE,
					[CITY_BUILDING_WUJUFANG]    = CITY_AMBI_RATE,
					[CITY_BUILDING_MICANG]      = CITY_AMBI_RATE,
					[CITY_BUILDING_CHENGQIANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_JIFANG]      = CITY_AMBI_RATE,
					[CITY_BUILDING_YISHE]       = CITY_AMBI_RATE,
					[CITY_BUILDING_WUFANG]      = CITY_AMBI_RATE,
					[CITY_BUILDING_JIANTA]      = CITY_AMBI_RATE,
					[CITY_BUILDING_SHUFANG]     = CITY_AMBI_RATE,
					[CITY_BUILDING_QIJI]        = CITY_AMBI_RATE,
					[CITY_BUILDING_XIAOCHANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_HUOBINGTA]   = CITY_AMBI_RATE,
					[CITY_BUILDING_DAQI]	      = CITY_AMBI_RATE,
}

--*******************************************************************************
--���н������ѧϰ����ܱ�
--*******************************************************************************
CITY_BUILDING_ABILITY_LIST = {
					--[CITY_BUILDING_SHUFANG]		= {ABILITY_XIUSHEN,ABILITY_SUTI},
					[CITY_BUILDING_DUANTAI]		= {ABILITY_ZHUZAO,ABILITY_FENGREN,ABILITY_CAIKUANG,ABILITY_GONGYI},
					[CITY_BUILDING_MICANG]		= {ABILITY_ZHONGZHI,ABILITY_CAIYAO,ABILITY_HUOXUE},
					[CITY_BUILDING_JIFANG]		=	{ABILITY_DIAOYU,ABILITY_YANGQI},
					[CITY_BUILDING_JIUSI]			=	{ABILITY_PENGREN,ABILITY_YANGSHENGFA},
					[CITY_BUILDING_YISHE]			=	{ABILITY_ZHIYAO,ABILITY_YAOLI},
					[CITY_BUILDING_QIANZHUANG]=	{ABILITY_QIANGSHEN,ABILITY_JIANTI},
}

--*******************************************************************************
--���н�����ѧϰ����������ܵ��������ñ�
--CITY_BUILDING_ABILITY_RULE[����ID][�����ȼ�] = {aid=����ID,amin=��ѧ��С�ȼ�,amax=��ѧ���ȼ�}
--*******************************************************************************
CITY_BUILDING_ABILITY_RULE = {}
CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_SHUFANG]	= {
					[2] = {
										{aid=ABILITY_XIUSHEN,			amin=0,		amax=30},
										{aid=ABILITY_SUTI,				amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_XIUSHEN,			amin=0,		amax=60},
										{aid=ABILITY_SUTI,				amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_XIUSHEN,			amin=0,		amax=100},
										{aid=ABILITY_SUTI,				amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_DUANTAI]		= {
					[0] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=6},
										{aid=ABILITY_FENGREN,			amin=0,		amax=6},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=6},
										{aid=ABILITY_GONGYI,			amin=0,		amax=6},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=6},
					},
					[1] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=7},
										{aid=ABILITY_FENGREN,			amin=0,		amax=7},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=7},
										{aid=ABILITY_GONGYI,			amin=0,		amax=7},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=7},
					},
					[2] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=8},
										{aid=ABILITY_FENGREN,			amin=0,		amax=8},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=8},
										{aid=ABILITY_GONGYI,			amin=0,		amax=8},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=8},
					},
					[3] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=9},
										{aid=ABILITY_FENGREN,			amin=0,		amax=9},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=9},
										{aid=ABILITY_GONGYI,			amin=0,		amax=9},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=9},
					},
					[4] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=10},
										{aid=ABILITY_FENGREN,			amin=0,		amax=10},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=10},
										{aid=ABILITY_GONGYI,			amin=0,		amax=10},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=10},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_MICANG]		= {
					[0] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=6},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=6},
					},
					[1] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=7},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=7},
					},
					[2] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=8},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=8},
										{aid=ABILITY_HUOXUE,			amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=9},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=9},
										{aid=ABILITY_HUOXUE,			amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=10},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=10},
										{aid=ABILITY_HUOXUE,			amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_JIFANG]		=	{
					[0] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=6},
					},
					[1] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=7},
					},
					[2] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=8},
										{aid=ABILITY_YANGQI,			amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=9},
										{aid=ABILITY_YANGQI,			amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=10},
										{aid=ABILITY_YANGQI,			amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_JIUSI]			=	{
					[1] = {
										{aid=ABILITY_PENGREN,			amin=0,		amax=7},
										{aid=ABILITY_YANGSHENGFA,	amin=0,		amax=50},
					},
					[2] = {
										{aid=ABILITY_PENGREN,			amin=0,		amax=9},
										{aid=ABILITY_YANGSHENGFA,	amin=0,		amax=70},
					},
					[3] = {
										{aid=ABILITY_PENGREN,			amin=0,		amax=10},
										{aid=ABILITY_YANGSHENGFA,	amin=0,		amax=99},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_YISHE]			=	{
					[1] = {
										{aid=ABILITY_ZHIYAO,			amin=0,		amax=7},
										{aid=ABILITY_YAOLI,				amin=0,		amax=50},
					},
					[2] = {
										{aid=ABILITY_ZHIYAO,			amin=0,		amax=9},
										{aid=ABILITY_YAOLI,				amin=0,		amax=70},
					},
					[3] = {
										{aid=ABILITY_ZHIYAO,			amin=0,		amax=10},
										{aid=ABILITY_YAOLI,				amin=0,		amax=99},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_QIANZHUANG]=	{
					[2] = {
										{aid=ABILITY_QIANGSHEN,		amin=0,		amax=30},
										{aid=ABILITY_JIANTI,			amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_QIANGSHEN,		amin=0,		amax=60},
										{aid=ABILITY_JIANTI,			amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_QIANGSHEN,		amin=0,		amax=100},
										{aid=ABILITY_JIANTI,			amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_SCRIPT	=	600022
--*******************************************************************************
--�ϳɲ����Լ���Ʒ����
--*******************************************************************************
ZHIYAO_CAILIAO1 = 1
ZHIYAO_CAILIAO2 = 2
ZHIYAO_CAILIAO3 = 3
ZHIYAO_CAILIAO4 = 4
ZHIYAO_CAILIAO5 = 5
ZHIYAO_CAILIAO6 = 6
ZHIYAO_CAILIAO7 = 7
ZHIYAO_CAILIAO8 = 8
ZHIYAO_CAILIAO9 = 9
ZHIYAO_CAILIAO10 = 10

ZHIYAO_CHANPIN1 = 1
ZHIYAO_CHANPIN2 = 2
ZHIYAO_CHANPIN3 = 3
ZHIYAO_CHANPIN4 = 4
ZHIYAO_CHANPIN5 = 5
ZHIYAO_CHANPIN6 = 6
ZHIYAO_CHANPIN7 = 7
ZHIYAO_CHANPIN8 = 8
ZHIYAO_CHANPIN9 = 9
ZHIYAO_CHANPIN10 = 10

ZHIYAO_CHANPINCHUJI = 11
ZHIYAO_CHANPINZHONGJI = 12
ZHIYAO_CHANPINGAOJI = 13

PENGREN_CAILIAO_GUWU1 = 11
PENGREN_CAILIAO_GUWU2 = 12
PENGREN_CAILIAO_GUWU3 = 13
PENGREN_CAILIAO_GUWU4 = 14
PENGREN_CAILIAO_GUWU5 = 15
PENGREN_CAILIAO_GUWU6 = 16
PENGREN_CAILIAO_GUWU7 = 17
PENGREN_CAILIAO_GUWU8 = 18
PENGREN_CAILIAO_GUWU9 = 19
PENGREN_CAILIAO_GUWU10 = 20

PENGREN_CHANPIN_GUWU1 = 14
PENGREN_CHANPIN_GUWU2 = 15
PENGREN_CHANPIN_GUWU3 = 16
PENGREN_CHANPIN_GUWU4 = 17
PENGREN_CHANPIN_GUWU5 = 18
PENGREN_CHANPIN_GUWU6 = 19
PENGREN_CHANPIN_GUWU7 = 20
PENGREN_CHANPIN_GUWU8 = 21
PENGREN_CHANPIN_GUWU9 = 22
PENGREN_CHANPIN_GUWU10 = 23

PENGREN_CHANPIN_GUWUCHUJI = 24
PENGREN_CHANPIN_GUWUZHONGJI = 25
PENGREN_CHANPIN_GUWUGAOJI = 26

PENGREN_CAILIAO_ZAWU1 = 21
PENGREN_CAILIAO_ZAWU2 = 22
PENGREN_CAILIAO_ZAWU3 = 23
PENGREN_CAILIAO_ZAWU4 = 24
PENGREN_CAILIAO_ZAWU5 = 25
PENGREN_CAILIAO_ZAWU6 = 26
PENGREN_CAILIAO_ZAWU7 = 27
PENGREN_CAILIAO_ZAWU8 = 28
PENGREN_CAILIAO_ZAWU9 = 29
PENGREN_CAILIAO_ZAWU10 = 30

PENGREN_CHANPIN_ZAWU1 = 27
PENGREN_CHANPIN_ZAWU2 = 28
PENGREN_CHANPIN_ZAWU3 = 29
PENGREN_CHANPIN_ZAWU4 = 30
PENGREN_CHANPIN_ZAWU5 = 31
PENGREN_CHANPIN_ZAWU6 = 32
PENGREN_CHANPIN_ZAWU7 = 33
PENGREN_CHANPIN_ZAWU8 = 34
PENGREN_CHANPIN_ZAWU9 = 35
PENGREN_CHANPIN_ZAWU10 = 36

PENGREN_CHANPIN_ZAWUCHUJI = 37
PENGREN_CHANPIN_ZAWUZHONGJI = 38
PENGREN_CHANPIN_ZAWUGAOJI = 39

--*******************************************************************************
--�����ʹ�����
--*******************************************************************************
--Vigor  ����   Energy   ����
--CONSUME_ABILITY_CAIYAO={{Vigor=10,Energy=0},
--						{Vigor=20,Energy=0},
--						{Vigor=30,Energy=0},
--						{Vigor=40,Energy=0},
--						{Vigor=50,Energy=0},
--						{Vigor=60,Energy=0},
--						{Vigor=70,Energy=0},
--						{Vigor=80,Energy=0},
--						{Vigor=90,Energy=0},
--						{Vigor=100,Energy=0},
--						{Vigor=110,Energy=0},
--						{Vigor=120,Energy=0},
--						}

--*******************************************************************************
--ABILITYLOGIC
--*******************************************************************************
ABILITYLOGIC_ID = 701601


--*******************************************************************************
--MissionData�и������ݵĶ���
--*******************************************************************************
MD_PINPAN_DAYCOUNT			= 0		--100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_PINPAN_HUAN				= 1		--ƽ��
MD_WABAO_DAYCOUNT			= 2		--100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_WABAO_HUAN				= 3		--�ڱ�
MD_BAIMASI_DAYCOUNT			= 4		--��������޸�����λ��ֻ�洢������������ modified by zhangguoxin 090207
MD_BAIMASI_HUAN				= 5		--������
MD_SHUILAO_DAYCOUNT			= 6		--100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_SHUILAO_HUAN				= 7		--ˮ��
MD_MURENXIANG_DAYCOUNT			= 8		--100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_MURENXIANG_HUAN			= 9		--ľ����
MD_WENDA_DAYCOUNT			=10		--100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_WENDA_HUAN				=11		--�ʴ�
MD_LINGLONG_DAYCOUNT			=12		--100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_LINGLONG_HUAN			=13		--����
MD_CAOYUN_DAYCOUNT			=14		--��������޸�����λ��ֻ�洢���������� modified by zhangguoxin 090207
MD_CAOYUN_HUAN				=15		--����
MD_SHIMEN_DAYCOUNT			=16		--��������޸�����λ��ֻ�洢ʦ��������� modified by zhangguoxin 090208
MD_SHIMEN_HUAN				=17		--�Ŵ�����ʦ������
MD_GAME_FLAG0				=18		-- ��Ϸ���λ
MD_GAME_FLAG1				=19		-- ��Ϸ���λ
MD_GAME_FLAG2				=20		-- ��Ϸ���λ
MD_GAME_FLAG3				=21		-- ��Ϸ���λ
MD_GAME_FLAG4				=22		-- ��Ϸ���λ
MD_GAME_FLAG5				=23		-- ��Ϸ���λ
MD_GAME_FLAG6				=24		-- ��Ϸ���λ
MD_GAME_FLAG7				=25		-- ��Ϸ���λ
MD_GAME_FLAG8				=26		-- ��Ϸ���λ
MD_GAME_FLAG9				=27		-- ��Ϸ���λ
MD_TIAOZHAN_SCRIPT			=28		--��̨��ս�����ű���
MD_ZHONGZHI_TIME			=29		--������ֲ��ʱ�䣬����һ�����ͬʱ��̫������
MD_FASONGTONGZHI_HUAN			=30		--����֪ͨ�Ļ���
MD_PREV_CAMP				=31		--��Ӫ�Ż��棬Ŀǰ�����ڽ�����̨�ǻ������ǰ����Ӫ��
MD_CATCH_PET				=32		--����׽�������񣬼�¼����
MD_SEND_MAIL				=33		--�����������񣬼�¼����
MD_RENWULIAN_DAYCOUNT			=34		--������ 100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_RENWULIAN_HUAN			=35		--�������Ļ���
MD_CAOYUN_MONSTERTIMER			=36		--���˵Ĺ�����ִ���
MD_QUIZ_DAYCOUNT			=37		--�����ʴ�ÿ�����Ĵ�����100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_CITY_ENGINEERING_ROUND		=38		--����������������
MD_CITY_ENGINEERING_TIME		=39		--������������������������ʱ��
MD_CITY_DEVELOPMENT_ROUND		=40		--����������չ����
MD_CITY_DEVELOPMENT_TIME		=41		--����������չ������������ʱ��
MD_CITY_SCITECH_ROUND			=42		--���������Ƽ�����
MD_CITY_SCITECH_TIME			=43		--���������Ƽ�������������ʱ��
MD_CITY_MARKET_ROUND			=44		--���������м�����
MD_CITY_MARKET_TIME			=45		--���������м�������������ʱ��
MD_FASONGTONGZHI_DAYCOUNT		=46		--��������޸�����λ��ֻ�洢����֪ͨ���� modified by zhangguoxin 090207
MD_CAPTUREPETABANDON_TIME		=47		--��׽���޷���ʱ�䡣Steven.Han 2006-8-15 14:18
MD_SHIMEN_DOUBLE_EXP			=48		--ʦ���Ƿ�Ϊ˫������ı�ʶ
MD_CHENGXIONGDATU_DAYCOUNT		=49		--��������޸�����λ��ֻ�洢���״�ͼ���� modified by zhangguoxin 090208
MD_CAOYUN_SUMTIME			=50		--���˵��ܴ���
MD_CAOYUN_BARGAINUP			=51		--���˵�̧��ʱ��
MD_CAOYUN_BARGAINDOWN			=52		--���˵�ɱ��ʱ��
MD_QUIZ_ASKTIME				=53		--�����ʴ����ʵ�ʱ��
MD_MIDAUTUMN_SCORE			=54		--�������
MD_CITY_EXPAND_ROUND			=55		--����������������
MD_RENWULIAN_ACCPETTIME			=56 		--�������Ľ���ʱ��
MD_STOPWATCH_PAUSE_FLAG			=57
MD_CITY_EXPAND_TIME			=58		--������������������������ʱ��
MD_CITY_CONSTRUCT_ROUND			=59		--����������������
MD_CITY_CONSTRUCT_TIME			=60		--������������������������ʱ��
MD_CITY_RESEARCH_ROUND			=61		--���������о�����
MD_CITY_RESEARCH_TIME			=62		--���������о�������������ʱ��
MD_ThiefSoldierInvade			=63		--�������ֻ���
MD_FUBENPARAM0				=64 		-- ��������1
MD_FUBENPARAM1				=65 		-- ��������2
MD_FUBENPARAM2				=66 		-- ��������3
MD_FUBENPARAM3				=67 		-- ��������4
MD_FUBENPARAM4				=68 		-- ��������5
MD_FUBENPARAM5				=69 		-- ��������6
MD_FUBENPARAM6				=70 		-- ��������7
MD_FUBENPARAM7				=71 		-- ��������8
MD_EXAM_TARGETID			=72			-- �ƾ�ϵͳ�����NPC ID
MD_EXAM_STARTTIME			=73			-- �ƾ�ϵͳ�Ŀ�ʼʱ��
MD_EXAM_SEQUENCE			=74			-- �ƾ�ϵͳ����Ĵ���
MD_EXAM_ASKTIME				=75			-- �ƾ�ϵͳ������ʱ��
MD_EXAM_FLAG					=76			-- �ƾ�ϵͳ�ı��
MD_ZHONGZHI_FLAG			=77		--������ֲ�ı�ǣ�������������������
MD_LAST_QIJU_DAY			=78		--��ֻ���������
MD_CITY_MILITARY_ROUND	= 79	-- ����������������
MD_CITY_MILITARY_TIME		= 80	-- ������������������������ʱ��
MD_DATAOSHA_ROUND				= 81	-- ����ɱ�ı���غ���
MD_DATAOSHA_RESULT			= 82	-- ����ɱ�ı�����
MD_EXAM_FEE_FLAG			=83			--�ƾٵ��Ƿ�ɷѵı��
MD_CAOYUN_TARGETID		=84			--���˵����NPC��¼
MD_EXAM_BRIBE_FLAG		=85			--�ƾ��Ƿ��¸�ı��
MD_EXAM_FIGHT_FLAG		=86			--�ƾ��Ƿ񸱱��ı��
MD_BUCHANG_MONEY      =87     --ɾ�������Ƿ�����Ǯ
MD_BUCHANG_STONE      =88     --ɾ�������Ƿ�����ʯͷ
MD_BUCHANG_EQUIP       =89     --ɾ�������Ƿ�����װ��
MD_EXAM_QUESTION       =90     --�ƾ��У���ǰ�������ĸ���
MD_RELATION_ABANDON			= 91		-- ��ϵ��������������ʱ��
MD_RELATION_MUWANQING		= 92		-- ľ��������
MD_RELATION_ZHONGLING		= 93		-- ��������
MD_RELATION_DUANYANQING		= 94		-- ����������
MD_RELATION_DUANYU			= 95		-- ��������
MD_RELATION_AZHU			= 96		-- ��������
MD_RELATION_ABI				= 97		-- ��������
MD_RELATION_WANGYUYAN		= 98		-- ����������
MD_RELATION_XIAOFENG		= 99		-- ��������
MD_RELATION_AZI				= 100		-- ��������
MD_RELATION_MURONGFU		= 101		-- Ľ�ݸ�����
MD_RELATION_XUZHU			= 102		-- ��������
MD_RELATION_JIUMOZHI		= 103		-- �Ħ������
MD_RELATION_YINCHUAN		= 104		-- ������������
MD_QUIZ_TARGET  	     =105     --�����ʴ��У����NPC��ID
MD_MENPAI_BOUNTY  	     =106     --���ɽ����ı��
MD_MILITARY_ROND_POSITION = 107 --����������Ҫ��
MD_RENWULIAN_HONGYUN_LASTTIME = 108 --�������ĺ��˵����ʱ���������
MD_FAVOROFGUILD_LASTTIME = 109 --�ϴ���ȡ���ɹػ���ʱ��
MD_MENPAI_BOUNTY_SHIZHUANG		=110     --����ʱװÿ����ֻ����ȡ1��
MD_RENWULIAN_EXCHANGEITEM = 111 --���������ƶ�ֵ�һ���Ʒ��ʱ������

MD_EXCHANGE_MIJIORYAOJUE		=112     --�Ƿ��Ѿ���ȡ�ؼ���Ҫ��

MD_ROUNDMISSION1			= 113		-- һ��Ҳ��������Ҳ������������~��
MD_CIRCUS_DAYCOUNT			= 114		--��Ϸ�ţ�100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��

MD_ROUNDMISSION2			= 115		-- ������������ȴʱ��,����(����)��Ҳ������������~��
MD_ROUNDMISSION3			= 116		-- ������������ȴʱ��,����(�˷�)��Ҳ������������~��
MD_NPC_DELMISSION           = 117       --���������NPC��ɾ��������~����������ٴ�ɾ��.

MD_JU_XUNHUAN_MUWANQING		= 118
MD_JU_XUNHUAN_MUWANQING_1		= 119
MD_JU_XUNHUAN_ZHONGLING		= 120
MD_JU_XUNHUAN_ZHONGLING_1		= 121
MD_JU_XUNHUAN_DUANYANQING	= 122
MD_JU_XUNHUAN_DUANYANQING_1	= 123
MD_JU_XUNHUAN_DUANYU			= 124
MD_JU_XUNHUAN_DUANYU_1			= 125
MD_JU_XUNHUAN_AZHU			  = 126
MD_JU_XUNHUAN_AZHU_1			  = 127
MD_JU_XUNHUAN_ABI				  = 128
MD_JU_XUNHUAN_ABI_1				  = 129
MD_JU_XUNHUAN_WANGYUYAN		= 130
MD_JU_XUNHUAN_WANGYUYAN_1		= 131
MD_JU_XUNHUAN_XIAOFENG		= 132
MD_JU_XUNHUAN_XIAOFENG_1		= 133
MD_JU_XUNHUAN_AZI				  = 134
MD_JU_XUNHUAN_AZI_1				  = 135
MD_JU_XUNHUAN_MURONGFU		= 136
MD_JU_XUNHUAN_MURONGFU_1		= 137
MD_JU_XUNHUAN_XUZHU			  = 138
MD_JU_XUNHUAN_XUZHU_1			  = 139
MD_JU_XUNHUAN_JIUMOZHI		= 140
MD_JU_XUNHUAN_JIUMOZHI_1		= 141
MD_JU_XUNHUAN_YINCHUAN		= 142
MD_JU_XUNHUAN_YINCHUAN_1		= 143
MD_GUILDTICKET_TAKENTIMES	= 144		-- ������Ʊһ����ȡ�Ĵ���
MD_GUILD_MIS_COUNT_TODAY	= 145  			--�������İ�������Ĵ���
MD_PRE_GUILD_MIS_TIME     = 146				--��һ����ɰ��������ʱ��

MD_ROUNDMISSION1_TIMES		= 147		-- һ��Ҳ������ÿ���ȡ�Ĵ���
MD_ROUNDMISSION2_TIMES		= 148		-- ����ÿ���ȡ�Ĵ���
MD_ROUNDMISSION3_TIMES		= 149		-- �˷�ÿ���ȡ�Ĵ���

MD_KILL_CAOYUN_PAOSHANG_CT = 150  -- һ��ʱ����ͷ������˺������˵Ĵ���
MD_KILL_CAOYUN_PAOSHANG_PRE_TIME = 151 --��һ�δ��ʱ��

-- ÿ��NPC�ľ���ѭ������ÿ����������50�Ρ�
MD_JQXH_MUWANQING_LIMITI			= 152		-- 100000�ı����ǵ�ǰ��ɵĻ�����С��100000������ʱ��
MD_JQXH_ZHONGLING_LIMITI			= 153		-- ͬ��
MD_JQXH_DUANYANQING_LIMITI		= 154		-- ͬ��
MD_JQXH_DUANYU_LIMITI					= 155		-- ͬ��
MD_JQXH_AZHU_LIMITI				  	= 156		-- ͬ��
MD_JQXH_ABI_LIMITI					  = 157		-- ͬ��
MD_JQXH_WANGYUYAN_LIMITI			= 158		-- ͬ��
MD_JQXH_XIAOFENG_LIMITI				= 159		-- ͬ��
MD_JQXH_AZI_LIMITI					  = 160		-- ͬ��
MD_JQXH_MURONGFU_LIMITI				= 161		-- ͬ��
MD_JQXH_XUZHU_LIMITI				  = 162		-- ͬ��
MD_JQXH_JIUMOZHI_LIMITI				= 163		-- ͬ��
MD_JQXH_YINCHUAN_LIMITI				= 164		-- ͬ��

MD_RELATION_QIANHONGYU		= 165		-- ��Ǯ����Ĺ�ϵֵ
MD_CAOYUN_COMPLETE_TIME		= 166		-- ������ɴ���ʱ��
MD_DRAWPAY_TIME				= 167		-- ��ȡ����ʱ��
MD_SALARY_PAYTIME			= 168		-- �����������ʷ���ʱ��
MD_YUANBAO_PRIZE_GEM_COUNT	= 169		-- Ԫ��������ʯ����
MD_JIAOFEI_TIMES			= 170   -- ÿ��Ľ˷˴�������¼ʱ��ʹ���
MD_JIAOFEI_PRE_TIME			= 171   -- ÿ��Ľ˷˴�������¼ʱ��ʹ���
MD_TDZ_TIME						= 172		-- ʹ��ҩ���������һЩ��Ҫ�����ݣ������У���������
MD_TDZ_SCENE					= 173
MD_TDZ_X							= 174
MD_TDZ_Y							= 175
MD_SPEAKER_STATE			= 176		-- ����ʹ�õ�С������Ʒ������
MD_BLUEHALO_DAYTIME		= 177		-- �ϴ���ȡ�����⻷��ʱ��
MD_HUASHANJIANGLI_TIME	=	178	--	��ɽ�۽�����ʱ��
MD_PEXP_GP_VALUE	=	179	--	�ﹱ��ȡʦ������ֵ
MD_PEXP_GP_TIME		=	180	--	�ﹱ��ȡʦ������ʱ��
MD_SHUILAO_ACCEPT_COUNT	=	181	--	ˮ��ÿ���������Ĵ���
MD_SHUILAO_ACCEPT_TIME	=	182	--	ˮ�ν��������ʱ��
MD_JIAOFEI_KILL_BOSS_TIME = 183 -- �����˷�ɱboss���ܴ���
MD_SHANG_YUE_FANG_YIAN_HUA = 184 -- ������ҹ���� ���·��̻�
MD_ZHONGQIU_TUANYUANPIE1_DAYTIME		= 185		-- �ϴ��Ը��������ȡ��Բ�����±���ʱ��
MD_ZHONGQIU_TUANYUANPIE2_DAYTIME		= 186		-- �ϴ��Է��������ȡ��Բ�����±���ʱ��
MD_ZHONGQIU_TUANYUANPIE3_DAYTIME		= 187		-- �ϴ��Խ�������ȡ��Բ�����±���ʱ��
MD_ZHONGQIU_TUANYUANPIE4A_DAYTIME		= 188		-- �ϴ���ʦ�������ȡ��Բ�����±���ʱ��
MD_ZHONGQIU_TUANYUANPIE4B_DAYTIME		= 189 	-- �ϴ���ͽ�������ȡ��Բ�����±���ʱ��
MD_AZHU_TUERDUO_COUNT = 190 -- ����ѭ������ �ö������
MD_PRISON_SHENYUAN_DAYTIME = 191 --�ϴ���ԩ������
MD_COUPLEQUESTION_DAYTIME	= 192 -- �������ش������ʱ�䣬һ��һ��
MD_CUJU_PRE_TIME = 193					-- ��һ�βμ���ϻ��ʱ��
MD_MISSHENBING_WEAPONLEVEL	= 194 -- Ѫ���������۳��������ȼ�
MD_YANZIWU_TIMES			=	195  -- ÿ�����������Ĵ���
MD_PRE_YANZIWU_TIME		=	196  -- ��һ��ȥ�������ʱ��
MD_SHITU_PRIZE_COUNT = 197			-- ʦͽ�齱����
MD_JOINMEIPAI_DAYTIME = 198		--��һ���Ƽ���Ҽ������ɵ�����
MD_JOINMEIPAI_COUNT = 199		--�����Ƽ���Ҽ������ɵĴ���
MD_LASTPLAYER_ID = 200 			-- �ϴ���ɱ��ҵ�ID
MD_XICONGTIANJIANG_LASTLV = 201	--07ʥ��Ԫ���_ϲ���콵 ����ϴβμӱ���ļ���
MD_GETGIFT_COUNT = 202		  --ʥ��Ԫ�����컻ȡ��Ʒ����
MD_GETGIFT_TIME = 203		  --ʥ��Ԫ�����컻ȡ��Ʒ����
MD_DAOJISHIDATI_YUANDAN_DAYTIME = 204 --07ʥ��Ԫ���_����ʱ��������ϴβμӵ�ʱ��
MD_DAOJISHIDATI_EXP = 205 						--07ʥ��Ԫ���_����ʱ������ҿ��Ի�õľ���
MD_QIANXUN_FUQI_DAYTIME 	= 206		-- ����ǧѰ���޹�ϵ�����ʱ��
MD_QIANXUN_JIEBAI_DAYTIME = 207		-- ����ǧѰ��ݹ�ϵ�����ʱ��
MD_QIANXUN_SHITU_DAYTIME 	= 208		-- ����ǧѰʦͽ��ϵ�����ʱ��
MD_QIANXUN_SELECT_MISSIONTYPE = 209	-- �����ѡ��ǧѰ��������
MD_HANYUBED_USEBOOK_LASTDAY = 210	-- ����ϴ�ʹ�ú��񴲹һ��������
MD_XINGYUN_DATA = 211	-- ����Ƿ����齱��3����Ʒ������
MD_HANYUBED_CANADDEXP_COUNT = 212	-- ����ں��񴲿��Ի�þ���Ĵ���(���񴲷�ֵ����)
MD_XINGYUN_TIME_INFO = 213	-- ��������ʱ����Ϣ
MD_50WAN_TIME_INFO = 214	-- 50��ͬ��ʱ����Ϣ

MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME		= 215		-- �ϴ��Ը��������ȡ����֮����ʱ��
MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME		= 216		-- �ϴ��Է��������ȡ��֮���ӵ�ʱ��
MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME		= 217		-- �ϴ��Խ�������ȡ��֮���ӵ�ʱ��
MD_CHUNJIE_TUANYUANJIAOZI4A_DAYTIME		= 218		-- �ϴ���ʦ�������ȡ��֮���ӵ�ʱ��
MD_CHUNJIE_TUANYUANJIAOZI4B_DAYTIME		= 219 	-- �ϴ���ͽ�������ȡ��֮���ӵ�ʱ��
MD_CHUNJIE_BIANPAO_DAYTIME		= 220		--�ϴ���ȡ����ʱ��
MD_CHUNJIE_BIANPAO_NUMBER			= 221		--������ȡ���ڸ���
MD_SPRING07DENGMI_DAYTIME = 222	--07Ԫ���ڻ_�ϴδ����ʱ��
MD_SHUANGXIANGPAO_LASTTIME = 223	--˫���ڻ_�ϴγ齱���ںʹ���
MD_GUILD_MANAGER_DRAW_BONUS = 224	--���ɹ�Ա��ȡ����ʱ��
MD_YURENJIE_LASTTIME = 225	--��λ��¼"���˽ڻ"�ϴ���ȡ��ʱ��(����Ϊ��λ)	--add by xindefeng
MD_GODOFFIRE_DAYTIME = 226	--�ϴ�ʥ�𴫵ݻ�Ĳμ�ʱ��

MD_LINGQUZHAOPAI_HAVESENDMAIL	=	227			--��λ��¼��һ�ڼ���ҵ�½�Ƿ��յ���"��ȡ���ƻ"���͵��ʼ�		--add by xindefeng
MD_LINGQUZHAOPAI_LASTDATE = 228					--��λ��¼"��һ��ȡ���ƻ"�ϴ���ȡ������(����Ϊ��λ)	--add by xindefeng
MD_GODOFFIRE_COMPLETE_COUNT	=	229				--��������ʥ���Ĵ���
MD_GODOFFIRE_COMPLETE_STEPNUM	=	230			--��������ʥ���������ڼ���
MD_GODOFFIRE_COMPLETE_DAYTIME	=	231			--��������ʥ����ʱ��(����Ϊ��λ)
MD_PIAOMIAOFENG_LASTTIME			= 232			--�ϴ���ս��翷�����ںʹ���
MD_SHITUZONGDONGYUAN_PRIZE_COUNT	=	233			--ʦͽ�ܶ�Ա������ȡ��Ʒ����
MD_PIAOMIAOFENG_SMALL_LASTTIME		= 234		--�ϴ���ս��翷�򵥰�����ںʹ���
MD_EX_HUMAN_QIANNENG_SUBJOIN = 235			--��Ҷ�Ǳ�ܵ����ĸ��Ӳ���
MD_SHITU_XINLIANXIN		= 236  --ʦͽ�����Ľ�����ȡʱ��
MD_GIFT_OUTLINE = 237            --���߾�����������
MD_SIGNATURE_GETPRIZE_TIME 	= 238 -- ǩ����ҽ�ʱ�� zchw
MD_SPY_DAYCOUNT 						= 239	-- ��̽��Ϣ����һ����ɴ��� ��λ������� 10�ı���Ϊʱ�䣨�죩 zchw
MD_SEEK_TREASURE 						= 240 -- Ѱ��� zchw
MD_XINSANHUAN_1_LAST	= 241 --�����������һ���ƽ�֮�������������ʱ��
MD_XINSANHUAN_1_DAYTIME	= 242 --�����������һ���ƽ�֮������ĵ��մ���
MD_XINSANHUAN_2_LAST	= 243 --����������ڶ��������������������ʱ��
MD_XINSANHUAN_2_DAYTIME	= 244 --����������ڶ�������������ĵ��մ���
MD_XINSANHUAN_3_LAST	= 245 --�������������������֮�������������ʱ��
MD_XINSANHUAN_3_DAYTIME	= 246 --�������������������֮������ĵ��մ���
MD_BANGGONGPAI_DAYTIME	= 247 --�ﹱ�Ƶĵ��մ���
MD_GUILD_COLLECT_DATA		= 248 --�����ռ������ zchw
MD_REEXPERIENCE_WEDDING	= 249 --���»��� zchw
MD_SHIMENCAIJI_COUNT          =250 --ʦ�Ųɼ�����Ĵ���
MD_SHIMENCAIJI_DAY            =251 --ʦ�Ųɼ�������
MD_QINGRENJIE_ARROWDAY        =252  --���˽ڻ�ϴ��찮��֮������
MD_QINGRENJIE_KISSDAY         =253  --���˽ڻ�ϴ���ȡ����֮�ǵ�����
MD_SHIMENCAIJI_ABANDON        =254  --ʦ�Ųɼ������ķ�������
MD_RESET_PMFSMALL_COUNT_LASTTIME	= 255	--�ϴ�����С��翷���ս���� �����ںʹ���
MD_FINDFRIENDAD_DELTIME_MARRY = 256      --����ϵͳ�У�����ϴγ���������Ϣ��ʱ��  --����չ�����Լ�256
MD_FINDFRIENDAD_DELTIME_GUILD = 257      --����ϵͳ�У�����ϴγ��������ɳ�Ա��Ϣ��ʱ��
MD_FINDFRIENDAD_DELTIME_TEACHER = 258      --����ϵͳ�У�����ϴγ�����ʦͽ��Ϣ��ʱ��
MD_FINDFRIENDAD_DELTIME_BROTHER = 259      --����ϵͳ�У�����ϴγ������ֵ���Ϣ��ʱ��
MD_GUILDBATTLE_SCORE 			= 260      --��ս���˻���
MD_GUILDBATTLE_FLAG 			= 261      --��ս����ռ��������
MD_GUILDBATTLE_RES 				= 262      --��ս���˲ɼ���Դ����
MD_GUILDBATTLE_PRIZESCORE = 263      --��ս������������
MD_TW_REEXPERIENCE_WEDDING_TODAY_COUNT	= 264--���»�����մ��� xiehong
MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT	= 265--���»����ܴ��� xiehong
MD_TW_HANYU_SPOUSEBOOK_LASTUSEDAY = 266 --�����ж�Ҫ�� zchw
MD_HEXIE_GUANGHUAN_DATE	= 267		--��г�⻷���һ�μ�BUFF�����ڣ�2009-3-26��2009-5-9�� xiehong
MD_HEXIE_GUANGHUAN_MAIL_DATE	= 268		--��г�⻷���һ�η����ʼ������ڣ�2009-3-26��2009-5-9�� xiehong
MD_LUOYANG_CITYMONEY = 269      		 --�����ȡ�������й��ʵ�ʱ��
MD_BAIBIANLIANPU_TIME = 270              --�ϴβμӰٱ����׻ʱ��
MD_MUWANQING_TUERDUO_COUNT = 271				 --ľ�������Ѱ�� �ö������ zchw

MD_TW_YURENJIE_LAST_LOGIN_DATE = 272 --���˽���һ�ε�½ʱ�� xiehong
MD_TW_YURENJIE_LAST_GET_EXP_DATE = 273 --���˽���һ���쾭���ʱ�� xiehong
MD_JQXH_DUANYANQING_COUNT = 274			--����������������� [tx]
--****begin****���²���Ϊ��������޸����ӵ�missiondata add by zhangguoxin 090207*********************
MD_CAOYUN_DAYTIME										= 275			--��������ʱ������
MD_FASONGTONGZHI_DAYTIME						= 276			--����֪ͨ��ʱ������
MD_BAIMASI_DAYTIME									= 277			--���������� ʱ���¼
MD_CHENGXIONGDATU_DAYTIME						= 278			--���״�ͼ ʱ������
MD_SHIMEN_DAYTIME										= 279			--ʦ������ ʱ������
--****end******��������޸����ӵ�missiondata add by zhangguoxin 090207*******************************
MD_LIXIAN_POOLEXP	= 280 	--���߾��������
MD_TW_QIANDAO_LAST_JOIN_TIME	= 281 --ǩ�����һ��ʱ�� xiehong
MD_TW_QIANDAO_JOIN_COUNT		= 282 --ǩ������ xiehong
MD_TW_XINGFUMOTIANLUN_LAST_MAIL_DATE		= 283 --�Ҹ�Ħ���֣���ȡ�ʼ����� xiehong

MD_TW_JIANIANHUA_XUANMU_DATE = 284 --�μӼ��껪-��תľ��ʱ��
MD_TW_BRAVERYCHALLENGE_RESET = 285 --���߹�ɽ�������ܱ�� --zz       
MD_TW_BRAVERYCHALLENGE_GIFT  = 286 --���߹�ɽ���콱 --zz 
MD_DAY_TO_HAVE_DWJKL  = 297	--��ö���ڿ��ֵ�ʱ��[tx]��һ�
MD_HK_TW_DAY_H1N1_COUNT	=	306	--̨�����H1N1�ÿ��ļ���
MD_SJZ_TIMES			=	242  -- ÿ������ľ�ׯ�Ĵ���
MD_PRE_SJZ_TIME		=	243  -- ��һ��ȥ�ľ�ׯ��ʱ��
MD_SSLT_TIMES			=	244  -- ÿ�����������̨�Ĵ���
MD_PRE_SSLT_TIME		=	245  -- ��һ��ȥ������̨��ʱ��
MD_SSS_TIMES			=	246  -- ÿ���������ɽ�Ĵ���
MD_PRE_SSS_TIME		=	287  -- ��һ��ȥ����ɽ��ʱ��
MD_ZHONGCHUI		=	288  -- ��ȡ�Ӗ�
MD_XIANHUAZHONGZI		=	289  -- ��ȡ�ʻ�������
MD_JIANGSHI_TIMES		=	290  
MD_PRE_JIANGSHI_TIME		=	291  

--*******************************************************************************
--��Ϸ���λ��Ŀǰ����ܵ� 319
--*******************************************************************************
MF_Dialog_01				= 0		-- ����ʦ�Ի����
MF_GetAwardFlag				= 1		-- �Ƿ񼤻� CD-KEY ��ȡ��������
MF_GetAward0Flag			= 2		-- �Ƿ��Ѿ���ȡ���� CD-Key ��Ʒ
MF_GetAward1Flag			= 3		-- �Ƿ��Ѿ���ȡ 30 �� CD-Key ��Ʒ
MF_GetAward2Flag			= 4		-- �Ƿ��Ѿ���ȡ 60 �� CD-Key ��Ʒ
MF_BUCHANG_MONEY    =5     --ɾ�������Ƿ�����Ǯ
MF_BUCHANG_STONE     =6     --ɾ�������Ƿ�����ʯͷ
MF_BUCHANG_EQUIP      =7     --ɾ�������Ƿ�����װ��
MF_ActiveNewUserCard	=8		--�Ƿ񼤻����ֿ�,558
MF_GetNewUserCard0		=9		--�Ƿ��Ѿ���ȡ1�����ֿ���Ʒ588
MF_GetNewUserCard1		=10		--�Ƿ��Ѿ���ȡ15�����ֿ���Ʒ588
MF_GetNewUserCard2		=11		--�Ƿ��Ѿ���ȡ30�����ֿ���Ʒ588
MF_GetNewUserCard3		=12		--�Ƿ��Ѿ���ȡ40�����ֿ���Ʒ588
MF_GetNewUserCard4		=13		--�Ƿ��Ѿ���ȡ50�����ֿ���Ʒ588
MF_GetNewUserCard5		=14		--�Ƿ��Ѿ���ȡ60�����ֿ���Ʒ588
MF_GetNewUserCard6		=15		--�Ƿ��Ѿ���ȡ70�����ֿ���Ʒ588
MF_GetNewUserCard7		=16		--�Ƿ��Ѿ���ȡ80�����ֿ���Ʒ588
MF_ActiveSportsCard		=17		--�Ƿ���ȡ�������½���
MF_ActiveJuCard				=18		--�Ƿ���ȡ���ۻ����
MF_LunjianJiangli01		=19		--��ɽ�۽��������01
MF_LunjianJiangli02		=20		--��ɽ�۽��������02
MF_LunjianJiangli03		=21		--��ɽ�۽��������03
MF_AZHU_RELATION_RESET	=22		--�����ϵֵ�Ƿ��Ѿ����ù���
MF_CannotPrisonShenyuan =23	--��ǰ�Ƿ��ֹ��ԩ
MF_TianGongJiangli60		=24		--�칤����60���������
MF_TianGongJiangli70		=25		--�칤����70���������
MF_TianGongJiangli80		=26		--�칤����80���������
MF_CHOUJIANGDALIBAO01   =27   --�齱�����һ��
MF_CHOUJIANGDALIBAO02   =28   --�齱���������
MF_DATAOSHA_WIN					=29		--����ɱ���غϻ�ʤ���
MF_ActiveWenZhouCard		=30		--�����ƹ����
MF_CHRISTMAS07_GIFT			=31		--07ʥ��Ԫ���_ʥ����ҹ������ȡ���
MF_LABORDAY_PETCAGE_GIFT		=32		--�Ƿ�μ���2008/05/01���������ͻ
MF_LABORDAY_PETCAGE_MAIL		=33		--�Ƿ��յ���2008/05/01�������ͻ�ʼ�
MF_ShiTuHelp_Mail		=34		--�Ƿ���ʦͽ�ܶ�Ա��ʼ�
MF_ShiTuHelp_30_prentice	=35		--�Լ��Ƿ���ȡ��30������
MF_ShiTuHelp_30_master		=36		--ʦ���Ƿ���ȡ��30������
MF_ShiTuHelp_45_prentice	=37		--�Լ��Ƿ���ȡ��30������
MF_ShiTuHelp_45_master		=38		--ʦ���Ƿ���ȡ��30������
MF_ShiTu_ChuShi_Flag			= 39  --�Ƿ��ʦ
MF_DianHuaMiBao_Gift	= 40 --�Ƿ���ȡ�˵绰�ܱ���Ʒ byLB JIA2008-7-29 10:26:30
MF_AnBaoDaLiBao_Gift		=41 --�Ƿ���ȡ�˰��������
MF_ActiveNewUserCard666	=42		--�Ƿ񼤻����ֿ�,666
MF_GetNewUserCard0_666		=43		--�Ƿ��Ѿ���ȡ1�����ֿ���Ʒ666
MF_GetNewUserCard1_666		=44		--�Ƿ��Ѿ���ȡ15�����ֿ���Ʒ666
MF_GetNewUserCard2_666		=45		--�Ƿ��Ѿ���ȡ30�����ֿ���Ʒ666
MF_GetNewUserCard3_666		=46		--�Ƿ��Ѿ���ȡ40�����ֿ���Ʒ666
MF_GetNewUserCard4_666		=47		--�Ƿ��Ѿ���ȡ50�����ֿ���Ʒ666
MF_GetNewUserCard5_666		=48		--�Ƿ��Ѿ���ȡ60�����ֿ���Ʒ666
MF_GetNewUserCard6_666		=49		--�Ƿ��Ѿ���ȡ70�����ֿ���Ʒ666
MF_GetNewUserCard7_666		=50		--�Ƿ��Ѿ���ȡ80�����ֿ���Ʒ666
MF_Xueshengzhuang_flag      =51     --9��17��ѧ��װ��Ƿ��Ѿ��μӹ�
MF_BangZhan_Kill_Flag = 52      --��ս��Ľ�������ȡɱ�˴������ƺţ�
MF_BangZhan_Flag_Flag = 53      --��ս��Ľ�������ȡռ���������ƺţ�
MF_BangZhan_Source_Flag = 54      --��ս��Ľ�������ȡ�ɼ���Դ���ƺţ�
MF_CHRISTMAS08_GIFT			= 55		--08ʥ��Ԫ���_ʥ����ҹ������ȡ��� zchw
MF_NEWPLAYER10_USED     =56     --���������10��)�Ƿ�ʹ�ù�
MF_GEM_PRIZE_FLAG			=57	
MF_TW_SCHOOLUNIFORM_JOIN =58       --�Ƿ�μӹ�������ʹУ�����ɼƻ�
MF_TW_EXPDAN10           =59       --�Ƿ�ʹ�ù�10�����鵤
MF_TW_EXPDAN20           =60       --�Ƿ�ʹ�ù�20�����鵤
MF_TW_EXPDAN30           =61       --�Ƿ�ʹ�ù�30�����鵤
MF_TW_EXPDAN40           =62       --�Ƿ�ʹ�ù�40�����鵤
MF_TW_EXPDAN50           =63       --�Ƿ�ʹ�ù�50�����鵤
MF_DARK_NOTIFYMAIL       =64
MF_TW_ZONGHENGSIHAI_JOIN =65 --�������껪֮�ݺ��ĺ���μӹ� xiehong
MF_TW_BRAVERYCHALLENGE1   =66       --̨��50���߹���ɽ����һ��־--zz
MF_TW_BRAVERYCHALLENGE2   =67       --̨��50���߹���ɽ�������־--zz����ʱ������ ����MissionFlag�㷨�����⣬67�ᵼ�´���Ľ��
MF_TW_BRAVERYCHALLENGE3   =68       --̨��50���߹���ɽ��������־--zz 
MF_TW_BRAVERYCHALLENGE22   =69       --̨��50���߹���ɽ�������־--zz

MF_GetQianKunDai  =70       --�Ƿ���ȡ������������(�����켰����)
--*******************************************************************************
--������
--*******************************************************************************
SCENE_SCRIPT_ID		= 888888
ALONENPC_SCRIPT_ID	= 888898
ALONENPC_TARGET_ID	= -123
PRIZE_SCRIPT_ID		= 888899

-- ���������ƽ�����������Ĭ�ϼ���ļ�����ֵ���ڳ�����ʼ��ʱ�Թ��Ｖ����е������˱�Ź̶����ܸ�
-- scene.lua ��Ҳ���������ڴ�����ֻ��Ϊ���ýű���鲻���ڲ�ͨ��
CopyScene_LevelGap	= 31

SCENE_LUOYANG			= 0		-- ����
SCENE_SUZHOU			= 1		-- ����
SCENE_DALI				= 2		-- ����
SCENE_SONGSHAN			= 3		-- ��ɽ
SCENE_TAIHU				= 4		-- ̫��
SCENE_JINGHU			= 5		-- ����
SCENE_WULIANG			= 6		-- ����ɽ
SCENE_JIANGE			= 7		-- ����
SCENE_DUNHUANG			= 8		-- �ػ�
SCENE_SHAOLIN			= 9		-- ������
SCENE_GAIBANG			= 10	-- ؤ���ܶ�
SCENE_PRISON			= 151	-- ����
SCENE_LOULAN			=	186	-- ¥��--add by xindefeng


--*******************************************************************************
--װ�����ű�
--*******************************************************************************
HEQUIP_WEAPON			= 0		-- ����	WEAPON
HEQUIP_CAP				= 1		-- ñ��	DEFENCE
HEQUIP_ARMOR			= 2		-- ����	DEFENCE
HEQUIP_CUFF				= 3		-- ����	DEFENCE
HEQUIP_BOOT				= 4		-- Ь	DEFENCE
HEQUIP_SASH				= 5		-- ����	ADORN
HEQUIP_RING				= 6		-- ����	ADORN
HEQUIP_NECKLACE			= 7		-- ����	ADORN
HEQUIP_RING_2			= 11	-- ��ָ2	ADORN
HEQUIP_CHARM			= 12	--����	DEFENCE
HEQUIP_CHARM_2			= 13	--�ڶ�������	DEFENCE
HEQUIP_WRIST			= 14	--����	DEFENCE
HEQUIP_SHOULDER			= 15	--����	ADORN
HEQUIP_DARK				= 17	--����

-- ���޽ű�
PETCOMMON				= 335000

--��������
FUBEN_EXAMPLE			= 999
FUBEN_MURENXIANG_7 		= 998
FUBEN_MURENXIANG_9		= 997
FUBEN_MURENXIANG		= 996
FUBEN_SHUILAO			= 995
FUBEN_ZHENGLONG			= 994
FUBEN_PVP_LEITAI		= 993
FUBEN_BOZANG			= 992
FUBEN_TAOHUAZHEN		= 991
FUBEN_JIUJIAO			= 990
FUBEN_GUANGMINGDONG		= 989
FUBEN_TALIN				= 988
FUBEN_TADI				= 987
FUBEN_ZHEMEIFENG		= 986
FUBEN_LINGXINGFENG		= 985
FUBEN_GUDI				= 984
FUBEN_WUSHENDONG		= 983
FUBEN_RENWULIAN			= 982
FUBEN_MINE				= 981
FUBEN_KILLVERMIN		= 980
FUBEN_CHUCKOUTVILLAIN	= 979
FUBEN_CONVOYPET			= 978
FUBEN_BIANGUAN			= 977	-- ������������
FUBEN_JIAOCHANG			= 976
FUBEN_TALIN1			= 975
FUBEN_GUANGMINGDONG1	= 974
FUBEN_JIUJIAO1			= 973
FUBEN_LINGXINGFENG1		= 972
FUBEN_TAOHUAZHEN1		= 971
FUBEN_TADI1				= 970
FUBEN_WUSHENDONG1		= 969
FUBEN_ZHEMEIFENG1		= 968
FUBEN_GUDI1				= 967
FUBEN_SHIJI2			= 966
FUBEN_GONGDI			= 965
FUBEN_SHIJI1			= 964
FUBEN_KAOCHANG			= 963
FUBEN_WEDDING			= 962
FUBEN_DATAOSHA			= 961
FUBEN_SONGLIAO			= 960
FUBEN_ZHULIN			= 959
FUBEN_FEIZHAI			= 958
FUBEN_ZEIBINGRUQIN	    = 957
FUBEN_JUQING			= 956
FUBEN_GUOFANG			= 955
FUBEN_BAOZANG			= 954
FUBEN_TIANLONG1			= 953
FUBEN_SHAOLIN1			= 952
FUBEN_MINGJIAO1			= 951
FUBEN_GAIBANG1			= 950
FUBEN_EMEI1				= 949
FUBEN_XINGXIU1			= 948
FUBEN_XIAOYAO1			= 947
FUBEN_WUDANG1			= 946
FUBEN_TIANSHAN1			= 945
FUBEN_YMGTAISHOUFU		= 944
FUBEN_JIAOFEI			= 943
FUBEN_CUJU					= 942
FUBEN_PORTECT_PET	= 941
FUBEN_CATCH_PET		= 940
FUBEN_DAZHAN_YZW	= 939
FUBEN_GODFIRE			= 938
FUBEN_PIAOMIAOFENG	= 937
FUBEN_PROTECTGUILD		= 936
FUBEN_XINSHENGSHOUSHAN = 935
FUBEN_SEEK_TREASURE		 = 934 -- zchw
FUBEN_HUANGJINZHILIAN	= 933
FUBEN_XUANFOUZHU	= 932
FUBEN_RONGYANZHIDI	= 931
FUBEN_BANGZHAN	= 930
FUBEN_JUQING_CANGMANGSHAN = 929
FUBEN_ZHIWU_JS = 928
--FUBEN_SHAOSHISHAN = 928
FUBEN_BINGSHENGQIZHEN	= 927
FUBEN_WANGLING	= 926

--���˻����¼�
PRE_TIME = 0
DUA_TIME = 0
EVENT_NOW = 0
TRAFFICKER_CLICK_TIMES = 0
CANDIDATE_EXAM = {
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},

{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0}
}

TOP_3_EXAM = {
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0}
}
-- ������ö��ֵ
GUILD_IND_LEVEL		= 0			--��ҵ��0
GUILD_AGR_LEVEL		= 1			--ũҵ��1
GUILD_COM_LEVEL		= 2			--��ҵ��2
GUILD_DEF_LEVEL		= 3			--������3
GUILD_TECH_LEVEL	= 4			--�Ƽ���4
GUILD_AMBI_LEVEL	= 5			--���Ŷ�5
GUILD_CONTRIB_POINT	= 6		--���׶�6
GUILD_MONEY				= 7			--�����ʽ�7
GUILD_IND_RATE		= 8			--��ҵ��8
GUILD_AGR_RATE		= 9			--ũҵ��9
GUILD_COM_RATE		= 10		--��ҵ��10
GUILD_DEF_RATE		= 11		--������11
GUILD_TECH_RATE		= 12		--�Ƽ���12
GUILD_AMBI_RATE		= 13		--������13
GUILD_SALARY		= 14		--���ʴ���14
-- ����֮����Ҫ�ı���
x026000_nDescIndex	= 0

-- ѧϰ�����Ṧ�Ļ���(50����)
STUDY_MENPAI_QINGGONG_SPEND = 100

--����ְλ
GUILD_POSITION_INVALID			= 0			--��Чλ��
GUILD_POSITION_TRAINEE			=	1			--Ԥ�����ڣ�����׼
GUILD_POSITION_MEMBER				=	2			--��ͨ����
GUILD_POSITION_ELITE_MEMBER	=	3			--��Ӣ����
GUILD_POSITION_COM					=	4			--��ҵ��Ա
GUILD_POSITION_AGRI					=	5			--ũҵ��Ա
GUILD_POSITION_INDUSTRY			=	6			--��ҵ��Ա
GUILD_POSITION_HR						=	7			--���¹�Ա
GUILD_POSITION_ASS_CHIEFTAIN=	8			--������
GUILD_POSITION_CHIEFTAIN		=	9			--����

--��Ʊ���
TICKET_ITEM_PARAM_CUR_MONEY_START	= 0		--����������Ʊ�ϵĵ�ǰ�ֽ����ݵ�start
TICKET_ITEM_PARAM_CUR_MONEY_TYPE	= 2		--����������Ʊ�ϵĵ�ǰ�ֽ����ݵ�type
TICKET_ITEM_PARAM_MAX_MONEY_START	= 4		--����������Ʊ�ϵĵ�ǰ�ֽ����޵�start
TICKET_ITEM_PARAM_MAX_MONEY_TYPE	= 2		--����������Ʊ�ϵĵ�ǰ�ֽ����޵�type
TICKET_ITEM_PARAM_MAX_MAX_MONEY_START = 8	--����������Ʊ�ϵĵ�ǰ�ֽ����޵����޵�start
TICKET_ITEM_PARAM_MAX_MAX_MONEY_TYPE = 2	--����������Ʊ�ϵĵ�ǰ�ֽ����޵����޵�type

--���صı�ʶ
EACTIVITY_BEFOREHAND_START = 0		-- Ԥ��׶�
EACTIVITY_SOON_START = 1					-- ������ʼ
EACTIVITY_JUSTNOW_START = 2				-- �ոտ�ʼ
EACTIVITY_INPROCESS = 3						-- ������...
EACTIVITY_BEFOREHAND_STOP = 4			-- ��������

--��Ʒ�������ɹ���
QUALITY_MUST_BE_CHANGE        = 0 -- ������Ҫ���޸ģ��������ֵ���Ҫ���޸ĳ������ֵ��
QUALITY_CREATE_DEFAULT        = 0 -- Ĭ�Ϲ���
QUALITY_CREATE_BY_MONSTER     = 0 -- ����������
QUALITY_CREATE_BY_BOSS        = 1 -- BOSS�ֵ������
QUALITY_CREATE_BY_FOUNDRY_NOR = 2 -- �ͼ����϶���
QUALITY_CREATE_BY_FOUNDRY_ADV = 3 -- �߼����϶���

--ҩ�����
JINGHU_YAODING_CREATER_NAME	  =""

--�������¿����
SPORTS_CARD_PRIZE = {
50101001,50101002,50102001,50102002,50102003,50102004,
50103001,50104002,50111001,50111002,50112001,50112002,
50112003,50112004,50113001,50113002,50113003,50113004,
50113005,50114001
}

--���ܿ�������
ONOFF_T_PETPRO	= 0	--���޷�ֳ
ONOFF_T_GUILD		= 1	--����
ONOFF_T_CITY		= 2	--����
ONOFF_T_PSHOP		= 3	--����̵�
ONOFF_T_CSHOP		= 4	--�����̵�
ONOFF_T_YBCASH		= 5	--Ԫ��ƱNPC�һ�
ONOFF_T_YBUSE		= 6	--Ԫ��Ʊʹ��

--������ؽű�
DEBUGHOOK_SCRIPT	= 777777

--���������־���
COUPLE_LOG_STARTQUESTION 			= 1
COUPLE_LOG_STOPQUESTION				= 2
COUPLE_LOG_FINISHQUESTION			= 3
COUPLE_LOG_LEARNSKILL					= 4
COUPLE_LOG_LEVELUPSKILL				= 5

--���������־��Ŷ�Ӧ����־��Ϣ
COUPLE_LOG_DETAIL = {
	[COUPLE_LOG_STARTQUESTION]	= "COUPLE_LOG_STARTQUESTION",
	[COUPLE_LOG_STOPQUESTION]		= "COUPLE_LOG_STOPQUESTION",
	[COUPLE_LOG_FINISHQUESTION]	= "COUPLE_LOG_FINISHQUESTION",
	[COUPLE_LOG_LEARNSKILL]			= "COUPLE_LOG_LEARNSKILL",
	[COUPLE_LOG_LEVELUPSKILL]		= "COUPLE_LOG_LEVELUPSKILL",
}

--�齱��־���
PRIZE_LOG_XINSHOUSHITU				= 1	--����ʦͽ�齱


--���ɹ����߸���
MIN_APPOINT_TIME_FOR_BONUS          = 7200  --��ȡ���ɸ�������ְʱ��Ҫ�󣨵�λ���ӣ� ����

--��ḣ����ȡ�Ľ�Ǯ��    ��ȡ�Ľ�Ǯ=min( ���ɽ�Ǯ*��1,���ȼ�*��2 )
GUILD_MANAGER_BONUS_MONEY_TABLE = {
    [GUILD_POSITION_INVALID]			=   { 0.0, 0},			--��Чλ��
    [GUILD_POSITION_TRAINEE]			=	{ 0.0, 0},			--Ԥ�����ڣ�����׼
    [GUILD_POSITION_MEMBER]				=	{ 0.0, 0},			--��ͨ����
    [GUILD_POSITION_ELITE_MEMBER]	    =	{ 0.0, 0},			--��Ӣ����
    [GUILD_POSITION_COM]			    =	{ 0.01, 10000},			--��ҵ��Ա
    [GUILD_POSITION_AGRI]				=	{ 0.01, 10000},			--ũҵ��Ա
    [GUILD_POSITION_INDUSTRY]			=	{ 0.01, 10000},			--��ҵ��Ա
    [GUILD_POSITION_HR]					=	{ 0.01, 10000},			--���¹�Ա
    [GUILD_POSITION_ASS_CHIEFTAIN]      =	{ 0.03, 30000},			--������
    [GUILD_POSITION_CHIEFTAIN]		    =	{ 0.05, 50000},			--����
}

--��ḣ����ȡ�ľ����  ��ȡ�ľ���=���ȼ�*���ȼ�*ְλ������
GUILD_MANAGER_BONUS_EXP_TABLE = {
    [GUILD_POSITION_INVALID]			=   0,			--��Чλ��
    [GUILD_POSITION_TRAINEE]			=	0,			--Ԥ�����ڣ�����׼
    [GUILD_POSITION_MEMBER]				=	0,			--��ͨ����
    [GUILD_POSITION_ELITE_MEMBER]	    =	0,			--��Ӣ����
    [GUILD_POSITION_COM]			    =	100,			--��ҵ��Ա
    [GUILD_POSITION_AGRI]				=	100,			--ũҵ��Ա
    [GUILD_POSITION_INDUSTRY]			=	100,			--��ҵ��Ա
    [GUILD_POSITION_HR]					=	100,			--���¹�Ա
    [GUILD_POSITION_ASS_CHIEFTAIN]      =	200,			--������
    [GUILD_POSITION_CHIEFTAIN]		    =	300,			--����
}

--����ְλ����
GUILD_POSITION_NAME_TABLE = {
    [GUILD_POSITION_INVALID]			=   "��Ч",			--��Чλ��
    [GUILD_POSITION_TRAINEE]			=	"Ԥ��Ⱥ��",			--Ԥ�����ڣ�����׼
    [GUILD_POSITION_MEMBER]				=	"����",			--��ͨ����
    [GUILD_POSITION_ELITE_MEMBER]	    =	"��Ӣ",			--��Ӣ����
    [GUILD_POSITION_COM]			    =	"����",			--��ҵ��Ա
    [GUILD_POSITION_AGRI]				=	"�뻯ʹ",			--ũҵ��Ա
    [GUILD_POSITION_INDUSTRY]			=	"����ʹ",			--��ҵ��Ա
    [GUILD_POSITION_HR]					=	"����ʹ",			--���¹�Ա
    [GUILD_POSITION_ASS_CHIEFTAIN]      =	"������",			--������
    [GUILD_POSITION_CHIEFTAIN]		    =	"����",			--����
}


---------------------------------------------------------------
--���أ�����漰��N���ű���ϵ���������Զ���һЩ��������
--���� 2008-04-17
---------------------------------------------------------------
--2008-04-17 �������ͻ
GlobalLaborDayActivityTable = {
	PetCageCardID					= 40004446, --ǩ������ƷID
	PetCageLv1 						= 30509500, --����һ����ƷID
	PetCageDelayBuff 				= 5941,
	
	PetCagePresentStartTime 		= 20080501, --�һ�������ʼʱ��
	PetCagePresentEndTime 			= 20080504, --�һ���������ʱ��
	
	CardPresentStartTime 			= 20080501,	--ǩ���ƿ�ʼ�һ�ʱ��
	CardPresentEndTime 				= 20080503,	--ǩ���ƽ����һ�ʱ��
	
	MailStartDayTime 				= 20080501,	--�����ʼ���ʼʱ��
	MailEndDayTime 					= 20080503	--�����ʼ�����ʱ��
}


--���������������

CITY_MISSION_TYPE_BUILDING	= 	0		--��������	
CITY_MISSION_TYPE_RESEARCH	=	1		--�о�����
CITY_MISSION_TYPE_KUOZHANG	=	2		--��������
CITY_MISSION_TYPE_GONGCHENG	=	3		--��������
CITY_MISSION_TYPE_KEJI		=	4		--�Ƽ�����
CITY_MISSION_TYPE_FAZHAN	=	5		--��չ����
CITY_MISSION_TYPE_SHIJI		=	6		--�м�����
CITY_MISSION_TYPE_GUOFANG	=	7		--��������
CITY_MISSION_TYPE_MAX		=	8		--�������ֵ


CITY_MISSION_VALUE_TYPE_MONEY		=	0	--�����������Ǯ����
CITY_MISSION_VALUE_TYPE_CONTRI		=	1	--����������ﹱ����
CITY_MISSION_VALUE_TYPE_CLOSED		=	2	--�������������
CITY_MISSION_VALUE_TYPE_MONEY_SUM	=	3	--�����������Ǯʣ��
CITY_MISSION_VALUE_TYPE_CONTRI_SUM	=	4	--����������ﹱʣ��
CITY_MISSION_VALUE_TYPE_MAX			=	5	--�������ֵ

CITY_MISSION_MGR_VALUE_TABLE_OFFSET	=	5
CITY_MISSION_MGR_VALUE_TABLE = {
	[0]		=	{	ContriCtrl = -5,	MoneyCtrl = 0.5 },
	[1]		=	{	ContriCtrl = -4,	MoneyCtrl = 0.6 },
	[2]		=	{	ContriCtrl = -3,	MoneyCtrl = 0.7 },
	[3]		=	{	ContriCtrl = -2,	MoneyCtrl = 0.8 },
	[4]		=	{	ContriCtrl = -1,	MoneyCtrl = 0.9 },
	[5]		=	{	ContriCtrl = 0,		MoneyCtrl = 1 },
	[6]		=	{	ContriCtrl = 1,		MoneyCtrl = 1.1 },
	[7]		=	{	ContriCtrl = 2,		MoneyCtrl = 1.2 },
	[8]		=	{	ContriCtrl = 3,		MoneyCtrl = 1.3 },
	[9]		=	{	ContriCtrl = 4,		MoneyCtrl = 1.4 },
	[10]	=	{	ContriCtrl = 5,		MoneyCtrl = 1.5 },
}

--LUA_AUDIT_ID BEGIN

LUAAUDIT_EXAMPLE = 1;
LUAAUDIT_BANGZHAN_CREATEFUBEN = 2;	--��ս��������
LUAAUDIT_BANGZHAN_RESOURCE = 3;			--ÿ����¹�����ڵ���Դ������
LUAAUDIT_BANGZHAN_FLAG = 4;					--��ս����ս������ռ�����
LUAAUDIT_BANGZHAN_HONOUR = 5;				--��ս�����ų�����ֵ����
LUAAUDIT_BANGZHAN_EXCHANGEHONOUR = 6;--��ս����ֵ��ȡ���Ʒ������
LUAAUDIT_BANGZHAN_TITLE_BUFF = 7;		--��ս��ȡ������ָ��˳ƺź�buff������
LUAAUDIT_PETSHELIZI = 8;	--�������������ӵ������ʹ���
LUAAUDIT_LOVEDAY = 9;			--���˽ڻ ÿ��μӻ���˴�
LUAAUDIT_DENGMI_START = 10;	--Ԫ���ڵ��� �㿪��������
LUAAUDIT_DENGMI_END = 11;		--Ԫ���ڵ��� ������д�������
--hzp 2009-1-14
LUAAUDIT_TSLB10 = 12;
LUAAUDIT_TSLB20 = 13;
LUAAUDIT_TSLB30 = 14;
LUAAUDIT_TSLB40 = 15;

LUAAUDIT_TSLBOUT = 16;
LUAAUDIT_SNOW = 17;			--��ѩ�׷���
LUAAUDIT_MPCARD_EXCHANGE = 18;	--���ɺ��� ������շ��ڶһ�������
LUAAUDIT_MPCARD_PRIZE = 19;			--���ɺ��� ��������������齱�������ͻ�õ���Ʒ��
LUAAUDIT_FEIHUANGSHI = 20;--[tx43454]�һ��ɻ�ʯ	
LUAAUDIT_FEIHUANGSHI_BOUND = 21;--[tx43454]�һ��󶨷ɻ�ʯ	
LUAAUDIT_MEIHUABIAO = 22;--[tx43454]�һ�÷����
LUAAUDIT_MWQ_TUERDUO = 23; --ľ�������Ѱ�� �ö���ų�ͳ��
LUAAUDIT_UNIVERSEBAG =24 --����������ʹ��ͳ��
LUAAUDIT_ANQITUPO = 25; --����ͻ��ƿ��ͳ��
LUAAUDIT_QIANKUNDAI_BULING_LEVEL1 = 33 ;--���������
LUAAUDIT_LINGQU_DWJKL = 44; --�ɹ���ȡ����ڿ�������
LUAAUDIT_USE_MWZONGZI = 45; --ʹ����ζ������
LUAAUDIT_MWZONGZI_PRIZE = 46; --ʹ�����Ӻ���������
LUAAUDIT_H1N1_WUXINGLINGPAI = 47;	--�����������
LUAAUDIT_H1N1_CHONGLOUYU = 48;	--�һ���¥��
LUAAUDIT_77_GIFTBAG = 49;	--����Ϧ���
--LUA_AUDIT_ID END

LUAAUDIT_TYPE_STRING =
{
	[LUAAUDIT_EXAMPLE] = "LUAAUDIT_EXAMPLE",
	[LUAAUDIT_BANGZHAN_CREATEFUBEN] = "LUAAUDIT_BANGZHAN_CREATEFUBEN",
	[LUAAUDIT_BANGZHAN_RESOURCE] = "LUAAUDIT_BANGZHAN_RESOURCE",
	[LUAAUDIT_BANGZHAN_FLAG] = "LUAAUDIT_BANGZHAN_FLAG",
	[LUAAUDIT_BANGZHAN_HONOUR] = "LUAAUDIT_BANGZHAN_HONOUR",
	[LUAAUDIT_BANGZHAN_EXCHANGEHONOUR] = "LUAAUDIT_BANGZHAN_EXCHANGEHONOUR",
	[LUAAUDIT_BANGZHAN_TITLE_BUFF] = "LUAAUDIT_BANGZHAN_TITLE_BUFF",
	[LUAAUDIT_PETSHELIZI] = "LUAAUDIT_PETSHELIZI",
	[LUAAUDIT_LOVEDAY] = "LUAAUDIT_LOVEDAY",
	[LUAAUDIT_DENGMI_START] = "LUAAUDIT_DENGMI_START",
	[LUAAUDIT_DENGMI_END] = "LUAAUDIT_DENGMI_END",
	--hzp 2009-1-14
	[LUAAUDIT_TSLB10] = "LUAAUDIT_TSLB10",
	[LUAAUDIT_TSLB20] = "LUAAUDIT_TSLB20",
	[LUAAUDIT_TSLB30] = "LUAAUDIT_TSLB30",
	[LUAAUDIT_TSLB40] = "LUAAUDIT_TSLB40",
	[LUAAUDIT_TSLBOUT]	= "LUAAUDIT_TSLBOUT",
	[LUAAUDIT_SNOW] = "LUAAUDIT_SNOW",
	[LUAAUDIT_MPCARD_EXCHANGE] = "LUAAUDIT_MPCARD_EXCHANGE",
	[LUAAUDIT_MPCARD_PRIZE] = "LUAAUDIT_MPCARD_PRIZE",
	[LUAAUDIT_FEIHUANGSHI] = "LUAAUDIT_FEIHUANGSHI",	--[tx43454]	
	[LUAAUDIT_FEIHUANGSHI_BOUND] = "LUAAUDIT_FEIHUANGSHI_BOUND",	--[tx43454]	
	[LUAAUDIT_MEIHUABIAO] = "LUAAUDIT_MEIHUABIAO", --[tx43454]
	[LUAAUDIT_MWQ_TUERDUO] = "LUAAUDIT_MWQ_TUERDUO",
	[LUAAUDIT_UNIVERSEBAG]= "LUAAUDIT_UNIVERSEBAG",
	[LUAAUDIT_ANQITUPO] = "LUAAUDIT_ANQITUPO",
	[LUAAUDIT_QIANKUNDAI_BULING_LEVEL1] = "LUAAUDIT_QIANKUNDAI_BULING_LEVEL1",
	[LUAAUDIT_LINGQU_DWJKL]="LUAAUDIT_LINGQU_DWJKL",
	[LUAAUDIT_USE_MWZONGZI]="LUAAUDIT_USE_MWZONGZI",
	[LUAAUDIT_MWZONGZI_PRIZE]="LUAAUDIT_MWZONGZI_PRIZE",
	[LUAAUDIT_H1N1_WUXINGLINGPAI]="LUAAUDIT_H1N1_WUXINGLINGPAI",
	[LUAAUDIT_H1N1_CHONGLOUYU]="LUAAUDIT_H1N1_CHONGLOUYU",
	[LUAAUDIT_77_GIFTBAG]="LUAAUDIT_77_GIFTBAG",
}
--******************************************************
--ͨ��Audit��־�ӿ�
--type��	ͳ����־��ʶ������LUAAUDIT��ǰ׺��
--logStr���Զ�����־�ַ�����
--����ˣ�zchw
--******************************************************
function ScriptGlobal_AuditGeneralLog(type, guid, logStr)
	if type >= 1  and type <= getn(LUAAUDIT_TYPE_STRING) then
		local str;
		if logStr == nil then
			str = format("%s,0X%08X,", LUAAUDIT_TYPE_STRING[type], guid);
		else
			str = format("%s,0X%08X,%s,", LUAAUDIT_TYPE_STRING[type], guid, logStr);
		end		
		LuaFnAuditGeneralLog(str);
		return 1;
	end
	return 0;
end

--******************************************************
--�ж�һ���������е��������Ƿ����ظ���ע�⣬���и���,nil���ᱻ����
--����: ������numTable
--û���ظ�Ԫ�ط���1��
--û��Ԫ�ػ��ߴ���nil������0
--dun.liu 2009.2.5
--******************************************************
function ScriptGlobal_IsUniqueNumberTable( numTable )
	
	local isUnique = 1;
	
	if( numTable == nil ) then
		return 0;
	end
	
	local tableLen = getn(numTable)
	if(tableLen <= 0) then
		return 0;
	end
	
	for i = 1, tableLen do
		if numTable[i] ~= nil and numTable[i] >= 0  then
		    for j = 1, tableLen do
		        if i ~= j and numTable[i] == numTable[j] then
		            isUnique = 0;
		            return isUnique;
		        end
		    end
	    end
	end
	
	return isUnique;
	
end
