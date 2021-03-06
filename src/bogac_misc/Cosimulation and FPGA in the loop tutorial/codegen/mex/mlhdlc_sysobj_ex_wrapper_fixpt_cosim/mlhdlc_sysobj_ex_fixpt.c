/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mlhdlc_sysobj_ex_fixpt.c
 *
 * Code generation for function 'mlhdlc_sysobj_ex_fixpt'
 *
 */

/* Include files */
#include "mlhdlc_sysobj_ex_fixpt.h"
#include "rt_nonfinite.h"

/* Type Definitions */
#ifndef typedef_dsp_Delay_0
#define typedef_dsp_Delay_0

typedef struct {
  int32_T S0_isInitialized;
  int16_T W0_IC_BUFF;
  int32_T W1_PrevNumChan;
  boolean_T W2_NeedsToInit;
  int16_T P0_IC;
} dsp_Delay_0;

#endif                                 /*typedef_dsp_Delay_0*/

/* Variable Definitions */
static dsp_Delay_0 h1;
static boolean_T h1_not_empty;
static dsp_Delay_0 h2;
static dsp_Delay_0 h3;
static dsp_Delay_0 h4;
static dsp_Delay_0 h5;
static dsp_Delay_0 h6;
static dsp_Delay_0 h7;
static dsp_Delay_0 h8;
static emlrtRSInfo k_emlrtRSI = { 32,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRSInfo l_emlrtRSI = { 33,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRSInfo m_emlrtRSI = { 34,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRSInfo n_emlrtRSI = { 35,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRSInfo o_emlrtRSI = { 36,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRSInfo p_emlrtRSI = { 37,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRSInfo q_emlrtRSI = { 38,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRSInfo r_emlrtRSI = { 39,  /* lineNo */
  "mlhdlc_sysobj_ex_fixpt",            /* fcnName */
  "/home/wardo/Documents/Matlab Projects/Cosimulation and FPGA in the loop tutorial/codegen/mlhdlc_sysobj_ex/fixpt/mlhdlc_sysobj_ex"
  "_fixpt.m"                           /* pathName */
};

static emlrtRTEInfo emlrtRTEI = { 49,  /* lineNo */
  20,                                  /* colNo */
  "step",                              /* fName */
  "/home/wardo/Documents/MATLAB/toolbox/eml/lib/scomp/step.m"/* pName */
};

/* Function Definitions */
void mlhdlc_sysobj_ex_fixpt(const emlrtStack *sp, int16_T x_in, int16_T h_in1,
  int16_T h_in2, uint16_T h_in3, uint16_T h_in4, int16_T *y_out, int16_T
  *delayed_xout)
{
  emlrtStack st;
  int32_T h_varargout_1;
  int32_T i1;
  int32_T i_varargout_1;
  int16_T b_varargout_1;
  int16_T c_varargout_1;
  int16_T d_varargout_1;
  int16_T e_varargout_1;
  int16_T f_varargout_1;
  int16_T g_varargout_1;
  int16_T i;
  int16_T varargout_1;
  st.prev = sp;
  st.tls = sp->tls;

  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
  /*                                                                           % */
  /*            Generated by MATLAB 9.9 and Fixed-Point Designer 7.1           % */
  /*                                                                           % */
  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
  /*  MATLAB design: Symmetric FIR Filter */
  /*   */
  /*  Design pattern covered in this example:  */
  /*   Filter states modeled using DSP System object (dsp.Delay) */
  /*   Filter coefficients passed in as parameters to the design */
  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
  /*    Copyright 2011-2015 The MathWorks, Inc. */
  /*  Symmetric FIR Filter */
  if (!h1_not_empty) {
    /* System object Constructor function: dsp.Delay */
    h1.S0_isInitialized = 0;
    h1.P0_IC = 0;
    h1_not_empty = true;

    /* System object Constructor function: dsp.Delay */
    h2.S0_isInitialized = 0;
    h2.P0_IC = 0;

    /* System object Constructor function: dsp.Delay */
    h3.S0_isInitialized = 0;
    h3.P0_IC = 0;

    /* System object Constructor function: dsp.Delay */
    h4.S0_isInitialized = 0;
    h4.P0_IC = 0;

    /* System object Constructor function: dsp.Delay */
    h5.S0_isInitialized = 0;
    h5.P0_IC = 0;

    /* System object Constructor function: dsp.Delay */
    h6.S0_isInitialized = 0;
    h6.P0_IC = 0;

    /* System object Constructor function: dsp.Delay */
    h7.S0_isInitialized = 0;
    h7.P0_IC = 0;

    /* System object Constructor function: dsp.Delay */
    h8.S0_isInitialized = 0;
    h8.P0_IC = 0;
  }

  st.site = &k_emlrtRSI;
  if (h1.S0_isInitialized != 1) {
    if (h1.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h1.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h1.W0_IC_BUFF = h1.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  varargout_1 = h1.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h1.W0_IC_BUFF = x_in;
  st.site = &l_emlrtRSI;
  if (h2.S0_isInitialized != 1) {
    if (h2.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h2.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h2.W0_IC_BUFF = h2.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  b_varargout_1 = h2.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h2.W0_IC_BUFF = varargout_1;
  st.site = &m_emlrtRSI;
  if (h3.S0_isInitialized != 1) {
    if (h3.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h3.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h3.W0_IC_BUFF = h3.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  c_varargout_1 = h3.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h3.W0_IC_BUFF = b_varargout_1;
  st.site = &n_emlrtRSI;
  if (h4.S0_isInitialized != 1) {
    if (h4.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h4.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h4.W0_IC_BUFF = h4.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  d_varargout_1 = h4.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h4.W0_IC_BUFF = c_varargout_1;
  st.site = &o_emlrtRSI;
  if (h5.S0_isInitialized != 1) {
    if (h5.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h5.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h5.W0_IC_BUFF = h5.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  e_varargout_1 = h5.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h5.W0_IC_BUFF = d_varargout_1;
  st.site = &p_emlrtRSI;
  if (h6.S0_isInitialized != 1) {
    if (h6.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h6.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h6.W0_IC_BUFF = h6.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  f_varargout_1 = h6.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h6.W0_IC_BUFF = e_varargout_1;
  st.site = &q_emlrtRSI;
  if (h7.S0_isInitialized != 1) {
    if (h7.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h7.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h7.W0_IC_BUFF = h7.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  g_varargout_1 = h7.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h7.W0_IC_BUFF = f_varargout_1;
  st.site = &r_emlrtRSI;
  if (h8.S0_isInitialized != 1) {
    if (h8.S0_isInitialized == 2) {
      emlrtErrorWithMessageIdR2018a(&st, &emlrtRTEI,
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen",
        "MATLAB:system:runtimeMethodCalledWhenReleasedCodegen", 0);
    }

    h8.S0_isInitialized = 1;

    /* System object Initialization function: dsp.Delay */
    h8.W0_IC_BUFF = h8.P0_IC;
  }

  /* System object Outputs function: dsp.Delay */
  *delayed_xout = h8.W0_IC_BUFF;

  /* System object Update function: dsp.Delay */
  h8.W0_IC_BUFF = g_varargout_1;

  /*  filtered output */
  i = (int16_T)(varargout_1 + *delayed_xout);
  if ((i & 16384) != 0) {
    i = (int16_T)(i | -16384);
  } else {
    i = (int16_T)(i & 16383);
  }

  if ((i & 8192) != 0) {
    i1 = i | -8192;
  } else {
    i1 = i & 8191;
  }

  i = (int16_T)((h_in1 * i1) >> 13);
  b_varargout_1 += g_varargout_1;
  if ((b_varargout_1 & 16384) != 0) {
    b_varargout_1 = (int16_T)(b_varargout_1 | -16384);
  } else {
    b_varargout_1 = (int16_T)(b_varargout_1 & 16383);
  }

  if ((b_varargout_1 & 8192) != 0) {
    h_varargout_1 = b_varargout_1 | -8192;
  } else {
    h_varargout_1 = b_varargout_1 & 8191;
  }

  b_varargout_1 = (int16_T)((h_in2 * h_varargout_1) >> 13);
  if ((i & 8192) != 0) {
    i1 = i | -8192;
  } else {
    i1 = i & 8191;
  }

  if ((b_varargout_1 & 8192) != 0) {
    h_varargout_1 = b_varargout_1 | -8192;
  } else {
    h_varargout_1 = b_varargout_1 & 8191;
  }

  i = (int16_T)(((i1 << 1) + h_varargout_1) >> 1);
  b_varargout_1 = (int16_T)(c_varargout_1 + f_varargout_1);
  if ((b_varargout_1 & 16384) != 0) {
    b_varargout_1 = (int16_T)(b_varargout_1 | -16384);
  } else {
    b_varargout_1 = (int16_T)(b_varargout_1 & 16383);
  }

  varargout_1 = (int16_T)(d_varargout_1 + e_varargout_1);
  if ((varargout_1 & 16384) != 0) {
    h_varargout_1 = varargout_1 | -16384;
  } else {
    h_varargout_1 = varargout_1 & 16383;
  }

  varargout_1 = (int16_T)((h_in4 * (h_varargout_1 >> 1)) >> 13);
  if ((i & 8192) != 0) {
    i1 = i | -8192;
  } else {
    i1 = i & 8191;
  }

  if ((b_varargout_1 & 8192) != 0) {
    h_varargout_1 = b_varargout_1 | -8192;
  } else {
    h_varargout_1 = b_varargout_1 & 8191;
  }

  if ((varargout_1 & 8192) != 0) {
    i_varargout_1 = varargout_1 | -8192;
  } else {
    i_varargout_1 = varargout_1 & 8191;
  }

  i1 += ((int16_T)(((h_in3 * h_varargout_1) >> 14) + (i_varargout_1 << 1)) >> 2)
    << 2;
  if ((i1 & 65536) != 0) {
    i1 |= -65536;
  } else {
    i1 &= 65535;
  }

  i = (int16_T)(i1 >> 2);
  if ((i & 8192) != 0) {
    *y_out = (int16_T)(i | -8192);
  } else {
    *y_out = (int16_T)(i & 8191);
  }

  /*  delayout input signal */
}

void mlhdlc_sysobj_ex_fixpt_free(void)
{
  /* System object Destructor function: dsp.Delay */
  if (h8.S0_isInitialized == 1) {
    h8.S0_isInitialized = 2;
  }

  /* System object Destructor function: dsp.Delay */
  if (h7.S0_isInitialized == 1) {
    h7.S0_isInitialized = 2;
  }

  /* System object Destructor function: dsp.Delay */
  if (h6.S0_isInitialized == 1) {
    h6.S0_isInitialized = 2;
  }

  /* System object Destructor function: dsp.Delay */
  if (h5.S0_isInitialized == 1) {
    h5.S0_isInitialized = 2;
  }

  /* System object Destructor function: dsp.Delay */
  if (h4.S0_isInitialized == 1) {
    h4.S0_isInitialized = 2;
  }

  /* System object Destructor function: dsp.Delay */
  if (h3.S0_isInitialized == 1) {
    h3.S0_isInitialized = 2;
  }

  /* System object Destructor function: dsp.Delay */
  if (h2.S0_isInitialized == 1) {
    h2.S0_isInitialized = 2;
  }

  /* System object Destructor function: dsp.Delay */
  if (h1.S0_isInitialized == 1) {
    h1.S0_isInitialized = 2;
  }
}

void mlhdlc_sysobj_ex_fixpt_init(void)
{
  h1_not_empty = false;
  h1.S0_isInitialized = 0;
  h2.S0_isInitialized = 0;
  h3.S0_isInitialized = 0;
  h4.S0_isInitialized = 0;
  h5.S0_isInitialized = 0;
  h6.S0_isInitialized = 0;
  h7.S0_isInitialized = 0;
  h8.S0_isInitialized = 0;
}

/* End of code generation (mlhdlc_sysobj_ex_fixpt.c) */
