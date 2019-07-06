/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//VBoxSvr/SharedWithVM/Memari_Project/MemariProject/RegFile.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {2, 0};
static int ng4[] = {3, 0};
static int ng5[] = {4, 0};
static int ng6[] = {32, 0};



static void Always_28_0(char *t0)
{
    char t13[8];
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    int t24;
    char *t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;

LAB0:    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 2716);
    *((int *)t2) = 1;
    t3 = (t0 + 2116);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(29, ng0);
    t11 = (t0 + 876U);
    t12 = *((char **)t11);
    t11 = (t0 + 1472);
    t15 = (t0 + 1472);
    t16 = (t15 + 44U);
    t17 = *((char **)t16);
    t18 = (t0 + 1472);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    t21 = (t0 + 784U);
    t22 = *((char **)t21);
    xsi_vlog_generic_convert_array_indices(t13, t14, t17, t20, 2, 1, t22, 5, 2);
    t21 = (t13 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (!(t23));
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB8;

LAB9:    goto LAB7;

LAB8:    t29 = *((unsigned int *)t13);
    t30 = *((unsigned int *)t14);
    t31 = (t29 - t30);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, *((unsigned int *)t14), t32, 0LL);
    goto LAB9;

}

static void Cont_31_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 2232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1472);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1472);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 600U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 2776);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 2724);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_32_2(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 2376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1472);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1472);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 692U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 2812);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 2732);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Initial_35_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t25[8];
    char t26[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    int t14;
    char *t15;
    unsigned int t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    int t21;
    int t22;
    unsigned int t23;
    char *t24;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;

LAB0:    xsi_set_current_line(36, ng0);

LAB2:    xsi_set_current_line(37, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1472);
    t5 = (t0 + 1472);
    t6 = (t5 + 44U);
    t7 = *((char **)t6);
    t8 = (t0 + 1472);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng1)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB3;

LAB4:    xsi_set_current_line(38, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 1472);
    t5 = (t0 + 1472);
    t6 = (t5 + 44U);
    t7 = *((char **)t6);
    t8 = (t0 + 1472);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng2)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB5;

LAB6:    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 1472);
    t5 = (t0 + 1472);
    t6 = (t5 + 44U);
    t7 = *((char **)t6);
    t8 = (t0 + 1472);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng3)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(40, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 1472);
    t5 = (t0 + 1472);
    t6 = (t5 + 44U);
    t7 = *((char **)t6);
    t8 = (t0 + 1472);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    t11 = ((char*)((ng4)));
    xsi_vlog_generic_convert_array_indices(t3, t4, t7, t10, 2, 1, t11, 32, 1);
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (!(t13));
    t15 = (t4 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (!(t16));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(41, ng0);
    xsi_set_current_line(41, ng0);
    t1 = ((char*)((ng5)));
    t2 = (t0 + 1564);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 6);

LAB11:    t1 = (t0 + 1564);
    t2 = (t1 + 36U);
    t5 = *((char **)t2);
    t6 = ((char*)((ng6)));
    memset(t3, 0, 8);
    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB13;

LAB12:    t8 = (t6 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB13;

LAB16:    if (*((unsigned int *)t5) < *((unsigned int *)t6))
        goto LAB14;

LAB15:    t10 = (t3 + 4);
    t13 = *((unsigned int *)t10);
    t16 = (~(t13));
    t19 = *((unsigned int *)t3);
    t20 = (t19 & t16);
    t23 = (t20 != 0);
    if (t23 > 0)
        goto LAB17;

LAB18:
LAB1:    return;
LAB3:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_assign_value(t2, t1, 0, *((unsigned int *)t4), t22);
    goto LAB4;

LAB5:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_assign_value(t2, t1, 0, *((unsigned int *)t4), t22);
    goto LAB6;

LAB7:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_assign_value(t2, t1, 0, *((unsigned int *)t4), t22);
    goto LAB8;

LAB9:    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t4);
    t21 = (t19 - t20);
    t22 = (t21 + 1);
    xsi_vlogvar_assign_value(t2, t1, 0, *((unsigned int *)t4), t22);
    goto LAB10;

LAB13:    t9 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB15;

LAB14:    *((unsigned int *)t3) = 1;
    goto LAB15;

LAB17:    xsi_set_current_line(42, ng0);
    t11 = (t0 + 1564);
    t12 = (t11 + 36U);
    t15 = *((char **)t12);
    memcpy(t4, t15, 8);
    t24 = (t0 + 1472);
    t27 = (t0 + 1472);
    t28 = (t27 + 44U);
    t29 = *((char **)t28);
    t30 = (t0 + 1472);
    t31 = (t30 + 40U);
    t32 = *((char **)t31);
    t33 = (t0 + 1564);
    t34 = (t33 + 36U);
    t35 = *((char **)t34);
    xsi_vlog_generic_convert_array_indices(t25, t26, t29, t32, 2, 1, t35, 6, 2);
    t36 = (t25 + 4);
    t37 = *((unsigned int *)t36);
    t14 = (!(t37));
    t38 = (t26 + 4);
    t39 = *((unsigned int *)t38);
    t17 = (!(t39));
    t18 = (t14 && t17);
    if (t18 == 1)
        goto LAB19;

LAB20:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1564);
    t2 = (t1 + 36U);
    t5 = *((char **)t2);
    t6 = ((char*)((ng2)));
    memset(t3, 0, 8);
    xsi_vlog_unsigned_add(t3, 32, t5, 6, t6, 32);
    t7 = (t0 + 1564);
    xsi_vlogvar_assign_value(t7, t3, 0, 0, 6);
    goto LAB11;

LAB19:    t40 = *((unsigned int *)t25);
    t41 = *((unsigned int *)t26);
    t21 = (t40 - t41);
    t22 = (t21 + 1);
    xsi_vlogvar_assign_value(t24, t4, 0, *((unsigned int *)t26), t22);
    goto LAB20;

}


extern void work_m_00000000001348388739_0254784918_init()
{
	static char *pe[] = {(void *)Always_28_0,(void *)Cont_31_1,(void *)Cont_32_2,(void *)Initial_35_3};
	xsi_register_didat("work_m_00000000001348388739_0254784918", "isim/MultiCycleProccessorTest_isim_beh.exe.sim/work/m_00000000001348388739_0254784918.didat");
	xsi_register_executes(pe);
}
