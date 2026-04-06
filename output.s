	.text
	.file	"huffman.cpp"
                                        # Start of file scope inline assembly
	.globl	_ZSt21ios_base_library_initv

                                        # End of file scope inline assembly
	.section	.text._ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE,"axG",@progbits,_ZN8NDecoder12THuffDecoderILm8EEC5ESt4spanIKmLm18446744073709551615EE,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE # -- Begin function _ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE
	.p2align	4, 0x90
	.type	_ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE,@function
_ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE: # @_ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception0
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$2120, %rsp                     # imm = 0x848
	.cfi_def_cfa_offset 2176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	leaq	_ZTVN8NDecoder12THuffDecoderILm8EEE+16(%rip), %rax
	movq	%rax, (%rdi)
	addq	$8, %rdi
	movl	$2044, %edx                     # imm = 0x7FC
	xorl	%esi, %esi
	callq	memset@PLT
	movq	%rbx, 8(%rsp)                   # 8-byte Spill
	leaq	2056(%rbx), %rdi
	movl	$2816, %edx                     # imm = 0xB00
	xorl	%esi, %esi
	callq	memset@PLT
	movl	$26, %eax
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movw	$0, 50(%rsp,%rax)
	movb	$0, 52(%rsp,%rax)
	movw	$0, 54(%rsp,%rax)
	movb	$0, 56(%rsp,%rax)
	movw	$0, 58(%rsp,%rax)
	movb	$0, 60(%rsp,%rax)
	movw	$0, 62(%rsp,%rax)
	movb	$0, 64(%rsp,%rax)
	movw	$0, 66(%rsp,%rax)
	movb	$0, 68(%rsp,%rax)
	movw	$0, 70(%rsp,%rax)
	movb	$0, 72(%rsp,%rax)
	movw	$0, 74(%rsp,%rax)
	movb	$0, 76(%rsp,%rax)
	addq	$28, %rax
	cmpq	$2070, %rax                     # imm = 0x816
	jne	.LBB0_1
# %bb.2:
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, 16(%rsp)
	movq	$0, 32(%rsp)
	xorl	%ebx, %ebx
	leaq	16(%rsp), %r15
	leaq	56(%rsp), %r12
	.p2align	4, 0x90
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	movq	(%r14,%rbx,8), %rax
	incq	%rax
	movq	%rax, 56(%rsp)
	movw	%bx, 64(%rsp)
.Ltmp0:
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_
.Ltmp1:
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=1
	movq	8(%rsp), %rax                   # 8-byte Reload
	movw	%bx, 10(%rax,%rbx,4)
	movw	%bx, 8(%rax,%rbx,4)
	incq	%rbx
	cmpq	$256, %rbx                      # imm = 0x100
	jne	.LBB0_3
# %bb.5:
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rax
	movq	(%rdi), %r13
	movzwl	8(%rdi), %ebp
	movq	%rax, %rcx
	subq	%rdi, %rcx
	cmpq	$17, %rcx
	jl	.LBB0_9
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	leaq	-16(%rax), %rdx
	movq	-16(%rax), %rcx
	vmovups	(%rdi), %xmm0
	movl	-8(%rax), %r8d
	vmovups	%xmm0, -16(%rax)
	subq	%rdi, %rdx
	sarq	$4, %rdx
.Ltmp3:
	xorl	%esi, %esi
	callq	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_
.Ltmp4:
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=1
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rax
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=1
	leaq	-16(%rax), %rcx
	movq	%rcx, 24(%rsp)
	movq	(%rdi), %r15
	movzwl	8(%rdi), %r14d
	movq	%rcx, %rdx
	subq	%rdi, %rdx
	cmpq	$17, %rdx
	jl	.LBB0_12
# %bb.10:                               #   in Loop: Header=BB0_6 Depth=1
	leaq	-32(%rax), %rdx
	movq	-32(%rax), %rcx
	vmovups	(%rdi), %xmm0
	movl	-24(%rax), %r8d
	vmovups	%xmm0, -32(%rax)
	subq	%rdi, %rdx
	sarq	$4, %rdx
.Ltmp6:
	xorl	%esi, %esi
	callq	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_
.Ltmp7:
# %bb.11:                               #   in Loop: Header=BB0_6 Depth=1
	movq	24(%rsp), %rcx
.LBB0_12:                               #   in Loop: Header=BB0_6 Depth=1
	addq	$-16, %rcx
	movq	%rcx, 24(%rsp)
	addq	%r13, %r15
	movq	%r15, 56(%rsp)
	leaq	256(%r12), %rbx
	movw	%bx, 64(%rsp)
.Ltmp9:
	leaq	16(%rsp), %rdi
	leaq	56(%rsp), %rsi
	callq	_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_
.Ltmp10:
# %bb.13:                               #   in Loop: Header=BB0_6 Depth=1
	movzwl	%bp, %eax
	movzwl	%r14w, %ecx
	movq	8(%rsp), %rdx                   # 8-byte Reload
	movw	%ax, 1032(%rdx,%r12,4)
	movw	%cx, 1034(%rdx,%r12,4)
	movw	%bx, 76(%rsp,%rax,4)
	movb	$0, 78(%rsp,%rax,4)
	movw	%bx, 76(%rsp,%rcx,4)
	movb	$1, 78(%rsp,%rcx,4)
	incq	%r12
	cmpq	$255, %r12
	jne	.LBB0_6
# %bb.14:
	movq	24(%rsp), %rax
	subq	16(%rsp), %rax
	cmpq	$16, %rax
	jne	.LBB0_22
# %bb.15:
	xorl	%ebp, %ebp
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	movq	8(%rsp), %r8                    # 8-byte Reload
	jmp	.LBB0_16
	.p2align	4, 0x90
.LBB0_33:                               #   in Loop: Header=BB0_16 Depth=1
	incq	%rbp
	cmpq	$256, %rbp                      # imm = 0x100
	je	.LBB0_23
.LBB0_16:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_17 Depth 2
                                        #     Child Loop BB0_30 Depth 2
	movq	$0, 2056(%r8,%rbp,8)
	movb	$0, 4104(%r8,%rbp)
	movq	%rbp, %r13
	movq	%r12, %rax
	jmp	.LBB0_17
	.p2align	4, 0x90
.LBB0_18:                               #   in Loop: Header=BB0_17 Depth=2
	movq	%r13, (%rax)
.LBB0_48:                               #   in Loop: Header=BB0_17 Depth=2
	addq	$8, %rax
	incb	4104(%r8,%rbp)
	movq	2056(%r8,%rbp,8), %rcx
	addq	%rcx, %rcx
	movzbl	78(%rsp,%r13,4), %edx
	orq	%rcx, %rdx
	movq	%rdx, 2056(%r8,%rbp,8)
	movzwl	76(%rsp,%r13,4), %r13d
	cmpq	$510, %r13                      # imm = 0x1FE
	je	.LBB0_28
.LBB0_17:                               #   Parent Loop BB0_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rbx, %rax
	jne	.LBB0_18
# %bb.34:                               #   in Loop: Header=BB0_17 Depth=2
	subq	%r12, %rbx
	movabsq	$9223372036854775800, %rax      # imm = 0x7FFFFFFFFFFFFFF8
	cmpq	%rax, %rbx
	je	.LBB0_35
# %bb.37:                               #   in Loop: Header=BB0_17 Depth=2
	movq	%r12, 48(%rsp)                  # 8-byte Spill
	movq	%rbx, %r15
	sarq	$3, %r15
	cmpq	$1, %r15
	movq	%r15, %rax
	adcq	$0, %rax
	leaq	(%rax,%r15), %r14
	movabsq	$1152921504606846975, %rcx      # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rcx, %r14
	jb	.LBB0_39
# %bb.38:                               #   in Loop: Header=BB0_17 Depth=2
	movq	%rcx, %r14
.LBB0_39:                               #   in Loop: Header=BB0_17 Depth=2
	addq	%r15, %rax
	cmovbq	%rcx, %r14
	testq	%r14, %r14
	je	.LBB0_40
# %bb.41:                               #   in Loop: Header=BB0_17 Depth=2
	leaq	(,%r14,8), %rdi
.Ltmp12:
	callq	_Znwm@PLT
.Ltmp13:
# %bb.42:                               #   in Loop: Header=BB0_17 Depth=2
	movq	%rax, %r12
	movq	%r13, (%r12,%r15,8)
	testq	%rbx, %rbx
	movq	48(%rsp), %r15                  # 8-byte Reload
	jle	.LBB0_45
.LBB0_44:                               #   in Loop: Header=BB0_17 Depth=2
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	callq	memmove@PLT
.LBB0_45:                               #   in Loop: Header=BB0_17 Depth=2
	testq	%r15, %r15
	je	.LBB0_47
# %bb.46:                               #   in Loop: Header=BB0_17 Depth=2
	movq	%r15, %rdi
	callq	_ZdlPv@PLT
.LBB0_47:                               #   in Loop: Header=BB0_17 Depth=2
	addq	%r12, %rbx
	movq	%rbx, %rax
	leaq	(%r12,%r14,8), %rbx
	movq	8(%rsp), %r8                    # 8-byte Reload
	jmp	.LBB0_48
.LBB0_40:                               #   in Loop: Header=BB0_17 Depth=2
	xorl	%r12d, %r12d
	movq	%r13, (%r12,%r15,8)
	testq	%rbx, %rbx
	movq	48(%rsp), %r15                  # 8-byte Reload
	jg	.LBB0_44
	jmp	.LBB0_45
	.p2align	4, 0x90
.LBB0_28:                               #   in Loop: Header=BB0_16 Depth=1
	movzbl	4104(%r8,%rbp), %ecx
	leal	-1(%rcx), %edx
	cmpb	$7, %dl
	ja	.LBB0_31
# %bb.29:                               #   in Loop: Header=BB0_16 Depth=1
	movzbl	%cl, %esi
	movl	$1, %edx
	.p2align	4, 0x90
.LBB0_30:                               #   Parent Loop BB0_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	-1(%rdx), %edi
	shlxl	%esi, %edi, %esi
	orq	2056(%r8,%rbp,8), %rsi
	movb	%bpl, 4360(%r8,%rsi,2)
	movb	%cl, 4361(%r8,%rsi,2)
	movzbl	4104(%r8,%rbp), %ecx
	movzbl	%cl, %esi
	movb	$8, %dil
	subb	%cl, %dil
	shrxl	%edi, %edx, %edi
	incl	%edx
	testl	%edi, %edi
	je	.LBB0_30
.LBB0_31:                               #   in Loop: Header=BB0_16 Depth=1
	cmpb	$9, %cl
	jb	.LBB0_33
# %bb.32:                               #   in Loop: Header=BB0_16 Depth=1
	movzbl	-64(%rax), %eax
	movzbl	2056(%r8,%rbp,8), %ecx
	movb	%al, 4360(%r8,%rcx,2)
	movb	$0, 4361(%r8,%rcx,2)
	jmp	.LBB0_33
.LBB0_23:
	testq	%r12, %r12
	je	.LBB0_25
# %bb.24:
	movq	%r12, %rdi
	callq	_ZdlPv@PLT
.LBB0_25:
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB0_27
# %bb.26:
	callq	_ZdlPv@PLT
.LBB0_27:
	addq	$2120, %rsp                     # imm = 0x848
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB0_35:
	.cfi_def_cfa_offset 2176
.Ltmp15:
	leaq	.L.str.2(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp16:
# %bb.36:
.LBB0_22:
	leaq	.L.str(%rip), %rdi
	leaq	.L.str.1(%rip), %rsi
	leaq	.L__PRETTY_FUNCTION__._ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE(%rip), %rcx
	movl	$44, %edx
	callq	__assert_fail@PLT
.LBB0_19:
.Ltmp5:
	jmp	.LBB0_54
.LBB0_20:
.Ltmp8:
	jmp	.LBB0_54
.LBB0_21:
.Ltmp11:
	jmp	.LBB0_54
.LBB0_53:
.Ltmp2:
.LBB0_54:
	movq	%rax, %rbx
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB0_57
	jmp	.LBB0_56
.LBB0_49:
.Ltmp14:
	movq	%rax, %rbx
	movq	48(%rsp), %r12                  # 8-byte Reload
	jmp	.LBB0_51
.LBB0_50:
.Ltmp17:
	movq	%rax, %rbx
.LBB0_51:
	testq	%r12, %r12
	jne	.LBB0_52
# %bb.55:
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	jne	.LBB0_56
.LBB0_57:
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.LBB0_52:
	movq	%r12, %rdi
	callq	_ZdlPv@PLT
	movq	16(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB0_57
.LBB0_56:
	callq	_ZdlPv@PLT
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end0:
	.size	_ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE, .Lfunc_end0-_ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE
	.cfi_endproc
	.section	.gcc_except_table._ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE,"aG",@progbits,_ZN8NDecoder12THuffDecoderILm8EEC5ESt4spanIKmLm18446744073709551615EE,comdat
	.p2align	2, 0x0
GCC_except_table0:
.Lexception0:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    # >> Call Site 1 <<
	.uleb128 .Ltmp0-.Lfunc_begin0           #   Call between .Lfunc_begin0 and .Ltmp0
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp0-.Lfunc_begin0           # >> Call Site 2 <<
	.uleb128 .Ltmp1-.Ltmp0                  #   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp2-.Lfunc_begin0           #     jumps to .Ltmp2
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp3-.Lfunc_begin0           # >> Call Site 3 <<
	.uleb128 .Ltmp4-.Ltmp3                  #   Call between .Ltmp3 and .Ltmp4
	.uleb128 .Ltmp5-.Lfunc_begin0           #     jumps to .Ltmp5
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp6-.Lfunc_begin0           # >> Call Site 4 <<
	.uleb128 .Ltmp7-.Ltmp6                  #   Call between .Ltmp6 and .Ltmp7
	.uleb128 .Ltmp8-.Lfunc_begin0           #     jumps to .Ltmp8
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp9-.Lfunc_begin0           # >> Call Site 5 <<
	.uleb128 .Ltmp10-.Ltmp9                 #   Call between .Ltmp9 and .Ltmp10
	.uleb128 .Ltmp11-.Lfunc_begin0          #     jumps to .Ltmp11
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp12-.Lfunc_begin0          # >> Call Site 6 <<
	.uleb128 .Ltmp13-.Ltmp12                #   Call between .Ltmp12 and .Ltmp13
	.uleb128 .Ltmp14-.Lfunc_begin0          #     jumps to .Ltmp14
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp13-.Lfunc_begin0          # >> Call Site 7 <<
	.uleb128 .Ltmp15-.Ltmp13                #   Call between .Ltmp13 and .Ltmp15
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp15-.Lfunc_begin0          # >> Call Site 8 <<
	.uleb128 .Ltmp16-.Ltmp15                #   Call between .Ltmp15 and .Ltmp16
	.uleb128 .Ltmp17-.Lfunc_begin0          #     jumps to .Ltmp17
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp16-.Lfunc_begin0          # >> Call Site 9 <<
	.uleb128 .Lfunc_end0-.Ltmp16            #   Call between .Ltmp16 and .Lfunc_end0
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end0:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text._ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_,"axG",@progbits,_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_,comdat
	.weak	_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_ # -- Begin function _ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_
	.p2align	4, 0x90
	.type	_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_,@function
_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_: # @_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	movq	8(%rdi), %r15
	cmpq	16(%rdi), %r15
	je	.LBB1_2
# %bb.1:
	vmovups	(%rsi), %xmm0
	vmovups	%xmm0, (%r15)
	movq	(%r14), %rbx
	movq	8(%r14), %r15
	addq	$16, %r15
	movq	%r15, 8(%r14)
	jmp	.LBB1_11
.LBB1_2:
	movq	(%r14), %r12
	subq	%r12, %r15
	movabsq	$9223372036854775792, %rax      # imm = 0x7FFFFFFFFFFFFFF0
	cmpq	%rax, %r15
	je	.LBB1_18
# %bb.3:
	movq	%r15, %rbp
	sarq	$4, %rbp
	cmpq	$1, %rbp
	movq	%rbp, %rax
	adcq	$0, %rax
	leaq	(%rax,%rbp), %r13
	movabsq	$576460752303423487, %rcx       # imm = 0x7FFFFFFFFFFFFFF
	cmpq	%rcx, %r13
	cmovaeq	%rcx, %r13
	addq	%rbp, %rax
	cmovbq	%rcx, %r13
	testq	%r13, %r13
	je	.LBB1_4
# %bb.5:
	movq	%r13, %rdi
	shlq	$4, %rdi
	movq	%rsi, %rbx
	callq	_Znwm@PLT
	movq	%rbx, %rsi
	movq	%rax, %rbx
	jmp	.LBB1_6
.LBB1_4:
	xorl	%ebx, %ebx
.LBB1_6:
	shlq	$4, %rbp
	vmovups	(%rsi), %xmm0
	vmovups	%xmm0, (%rbx,%rbp)
	testq	%r15, %r15
	jle	.LBB1_8
# %bb.7:
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	memmove@PLT
.LBB1_8:
	leaq	16(%rbx,%r15), %r15
	testq	%r12, %r12
	je	.LBB1_10
# %bb.9:
	movq	%r12, %rdi
	callq	_ZdlPv@PLT
.LBB1_10:
	movq	%rbx, (%r14)
	movq	%r15, 8(%r14)
	shlq	$4, %r13
	addq	%rbx, %r13
	movq	%r13, 16(%r14)
.LBB1_11:
	movq	-16(%r15), %rax
	movzwl	-8(%r15), %ecx
	subq	%rbx, %r15
	sarq	$4, %r15
	leaq	-1(%r15), %rdx
	cmpq	$2, %r15
	jl	.LBB1_17
	.p2align	4, 0x90
.LBB1_12:                               # =>This Inner Loop Header: Depth=1
	leaq	-1(%rdx), %rsi
	movq	%rsi, %rdi
	shrq	%rdi
	movq	%rdi, %r8
	shlq	$4, %r8
	movq	(%rbx,%r8), %r10
	cmpq	%rax, %r10
	movl	$0, %r9d
	sbbl	%r9d, %r9d
	cmpq	%rax, %r10
	jne	.LBB1_14
# %bb.13:                               #   in Loop: Header=BB1_12 Depth=1
	movzwl	8(%rbx,%r8), %r10d
	cmpw	%cx, %r10w
	movl	$0, %r9d
	sbbl	%r9d, %r9d
	cmpw	%cx, %r10w
	je	.LBB1_17
.LBB1_14:                               #   in Loop: Header=BB1_12 Depth=1
	orb	$1, %r9b
	testb	%r9b, %r9b
	jle	.LBB1_17
# %bb.15:                               #   in Loop: Header=BB1_12 Depth=1
	addq	%rbx, %r8
	shlq	$4, %rdx
	vmovups	(%r8), %xmm0
	vmovups	%xmm0, (%rbx,%rdx)
	movq	%rdi, %rdx
	cmpq	$1, %rsi
	ja	.LBB1_12
# %bb.16:
	xorl	%edx, %edx
.LBB1_17:
	shlq	$4, %rdx
	movq	%rax, (%rbx,%rdx)
	movw	%cx, 8(%rbx,%rdx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB1_18:
	.cfi_def_cfa_offset 64
	leaq	.L.str.2(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Lfunc_end1:
	.size	_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_, .Lfunc_end1-_ZNSt14priority_queueIZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS6_SaIS6_EESt7greaterIvEE4pushEOS6_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm,"axG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm # -- Begin function _ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.p2align	4, 0x90
	.type	_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm,@function
_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm: # @_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.cfi_startproc
# %bb.0:
	movq	(%rcx), %rsi
	movq	%rsi, %rax
	shrq	$3, %rax
	movzwl	(%rdx,%rax), %r8d
	movzbl	2(%rdx,%rax), %eax
	shll	$16, %eax
	orl	%r8d, %eax
	movl	%esi, %r8d
	andb	$7, %r8b
	shrxl	%r8d, %eax, %eax
	movzbl	%al, %eax
	movzbl	4361(%rdi,%rax,2), %r8d
	testq	%r8, %r8
	je	.LBB2_2
# %bb.1:
	addq	%r8, %rsi
	movq	%rsi, (%rcx)
	movzbl	4360(%rdi,%rax,2), %eax
                                        # kill: def $al killed $al killed $eax
	retq
.LBB2_2:
	addq	$8, %rsi
	movq	%rsi, (%rcx)
	movzbl	4360(%rdi,%rax,2), %eax
	orl	$256, %eax                      # imm = 0x100
.LBB2_3:                                # =>This Inner Loop Header: Depth=1
	movq	%rsi, %r8
	shrq	$3, %r8
	movzbl	(%rdx,%r8), %r8d
	movl	%esi, %r9d
	andb	$7, %r9b
	shrxl	%r9d, %r8d, %r8d
	andl	$1, %r8d
	movzwl	%ax, %eax
	addl	%r8d, %r8d
	leal	(%r8,%rax,4), %eax
	movzwl	8(%rdi,%rax), %eax
	incq	%rsi
	movq	%rsi, (%rcx)
	cmpl	$255, %eax
	ja	.LBB2_3
# %bb.4:
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end2:
	.size	_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm, .Lfunc_end2-_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm,"axG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm # -- Begin function _ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm
	.p2align	4, 0x90
	.type	_ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm,@function
_ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm: # @_ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm
	.cfi_startproc
# %bb.0:
	movl	%esi, %eax
	cmpl	$256, %esi                      # imm = 0x100
	jb	.LBB3_3
# %bb.1:
	movq	(%r8), %rdx
	.p2align	4, 0x90
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	movq	%rdx, %rsi
	shrq	$3, %rsi
	movzbl	(%rcx,%rsi), %esi
	movl	%edx, %r9d
	andb	$7, %r9b
	shrxl	%r9d, %esi, %esi
	andl	$1, %esi
	movzwl	%ax, %eax
	addl	%esi, %esi
	leal	(%rsi,%rax,4), %eax
	movzwl	8(%rdi,%rax), %eax
	incq	%rdx
	movq	%rdx, (%r8)
	cmpl	$255, %eax
	ja	.LBB3_2
.LBB3_3:
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end3:
	.size	_ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm, .Lfunc_end3-_ZN8NDecoder12THuffDecoderILm8EE15GetNextFromTreeEtSt17basic_string_viewIcSt11char_traitsIcEERm
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,"axG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE # -- Begin function _ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
	.p2align	4, 0x90
	.type	_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,@function
_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE: # @_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
.Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception1
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %r15
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %rbx
	leaq	24(%rsp), %r14
	movq	%r14, 8(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 24(%rsp)
	movq	$0, 40(%rsp)
	movl	$0, 48(%rsp)
	movb	$61, %al
	bzhiq	%rax, %rdx, %rax
	cmpq	$15, %rax
	jb	.LBB4_3
# %bb.1:
	cmpq	$30, %rax
	movl	$29, %ebp
	cmovaeq	%rax, %rbp
	leaq	2(%rbp), %rdi
.Ltmp18:
	callq	_Znwm@PLT
.Ltmp19:
# %bb.2:
	incq	%rbp
	movb	$0, (%rax)
	movq	%rax, 8(%rsp)
	movq	%rbp, 24(%rsp)
.LBB4_3:
.Ltmp20:
	leaq	8(%rsp), %rcx
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE
.Ltmp21:
# %bb.4:
	movq	16(%rsp), %r15
	movslq	48(%rsp), %r12
	testq	%r12, %r12
	jle	.LBB4_11
# %bb.5:
	leaq	1(%r15), %r13
	movq	8(%rsp), %rax
	movl	$15, %ecx
	cmpq	%r14, %rax
	je	.LBB4_7
# %bb.6:
	movq	24(%rsp), %rcx
.LBB4_7:
	movzbl	40(%rsp), %ebp
	cmpq	%rcx, %r13
	jbe	.LBB4_10
# %bb.8:
.Ltmp23:
	leaq	8(%rsp), %rdi
	movl	$1, %r8d
	movq	%r15, %rsi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
.Ltmp24:
# %bb.9:
	movq	8(%rsp), %rax
.LBB4_10:
	movb	%bpl, (%rax,%r15)
	movq	%r13, 16(%rsp)
	movq	8(%rsp), %rax
	movb	$0, 1(%rax,%r15)
.LBB4_11:
	leaq	(%r12,%r15,8), %rax
	movq	%rax, (%rbx)
	leaq	24(%rbx), %rdi
	movq	%rdi, 8(%rbx)
	movq	8(%rsp), %rax
	cmpq	%r14, %rax
	je	.LBB4_12
# %bb.13:
	movq	%rax, 8(%rbx)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbx)
	movq	16(%rsp), %r15
	jmp	.LBB4_14
.LBB4_12:
	movq	16(%rsp), %r15
	leaq	1(%r15), %rdx
	movq	%r14, %rsi
	callq	memcpy@PLT
.LBB4_14:
	movq	%r15, 16(%rbx)
	movq	%rbx, %rax
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB4_19:
	.cfi_def_cfa_offset 112
.Ltmp25:
	jmp	.LBB4_16
.LBB4_15:
.Ltmp22:
.LBB4_16:
	movq	%rax, %rbx
	movq	8(%rsp), %rdi
	cmpq	%r14, %rdi
	je	.LBB4_18
# %bb.17:
	callq	_ZdlPv@PLT
.LBB4_18:
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end4:
	.size	_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE, .Lfunc_end4-_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
	.cfi_endproc
	.section	.gcc_except_table._ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,"aG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,comdat
	.p2align	2, 0x0
GCC_except_table4:
.Lexception1:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end1-.Lcst_begin1
.Lcst_begin1:
	.uleb128 .Ltmp18-.Lfunc_begin1          # >> Call Site 1 <<
	.uleb128 .Ltmp21-.Ltmp18                #   Call between .Ltmp18 and .Ltmp21
	.uleb128 .Ltmp22-.Lfunc_begin1          #     jumps to .Ltmp22
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp23-.Lfunc_begin1          # >> Call Site 2 <<
	.uleb128 .Ltmp24-.Ltmp23                #   Call between .Ltmp23 and .Ltmp24
	.uleb128 .Ltmp25-.Lfunc_begin1          #     jumps to .Ltmp25
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp24-.Lfunc_begin1          # >> Call Site 3 <<
	.uleb128 .Lfunc_end4-.Ltmp24            #   Call between .Ltmp24 and .Lfunc_end4
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end1:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text._ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE,"axG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE # -- Begin function _ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE
	.p2align	4, 0x90
	.type	_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE,@function
_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE: # @_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 24(%rsp)                  # 8-byte Spill
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	testq	%rsi, %rsi
	je	.LBB5_19
# %bb.1:
	movq	%rcx, %rbx
	addq	%rdx, 16(%rsp)                  # 8-byte Folded Spill
	leaq	16(%rcx), %r8
	movl	40(%rcx), %eax
	movq	32(%rcx), %rsi
	movq	%r8, (%rsp)                     # 8-byte Spill
	jmp	.LBB5_2
	.p2align	4, 0x90
.LBB5_18:                               #   in Loop: Header=BB5_2 Depth=1
	movq	32(%rsp), %rdx                  # 8-byte Reload
	incq	%rdx
	movq	%r14, %rsi
	movl	%ecx, %eax
	cmpq	16(%rsp), %rdx                  # 8-byte Folded Reload
	je	.LBB5_19
.LBB5_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_3 Depth 2
	movq	%rdx, 32(%rsp)                  # 8-byte Spill
	movzbl	(%rdx), %ecx
	movq	24(%rsp), %rdx                  # 8-byte Reload
	shlxq	%rax, 2056(%rdx,%rcx,8), %r14
	orq	%rsi, %r14
	movq	%r14, 32(%rbx)
	movzbl	4104(%rdx,%rcx), %ecx
	addl	%eax, %ecx
	movl	%ecx, 40(%rbx)
	cmpl	$8, %ecx
	jge	.LBB5_3
	jmp	.LBB5_18
	.p2align	4, 0x90
.LBB5_8:                                #   in Loop: Header=BB5_3 Depth=2
	movq	%rcx, %rbp
.LBB5_17:                               #   in Loop: Header=BB5_3 Depth=2
	movb	%r14b, (%rbp,%r13)
	movq	%r12, 8(%rbx)
	movq	(%rbx), %rax
	movb	$0, 1(%rax,%r13)
	movq	32(%rbx), %r14
	shrq	$8, %r14
	movq	%r14, 32(%rbx)
	movl	40(%rbx), %eax
	leal	-8(%rax), %ecx
	movl	%ecx, 40(%rbx)
	cmpl	$15, %eax
	jle	.LBB5_18
.LBB5_3:                                #   Parent Loop BB5_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rbx), %rcx
	movq	8(%rbx), %r13
	leaq	1(%r13), %r12
	cmpq	%r8, %rcx
	je	.LBB5_4
# %bb.7:                                #   in Loop: Header=BB5_3 Depth=2
	movq	(%r8), %rax
	cmpq	%rax, %r12
	jbe	.LBB5_8
	jmp	.LBB5_5
	.p2align	4, 0x90
.LBB5_4:                                #   in Loop: Header=BB5_3 Depth=2
	movl	$15, %eax
	movq	%r8, %rbp
	cmpq	$15, %r12
	jbe	.LBB5_17
.LBB5_5:                                #   in Loop: Header=BB5_3 Depth=2
	testq	%r12, %r12
	js	.LBB5_6
# %bb.9:                                #   in Loop: Header=BB5_3 Depth=2
	addq	%rax, %rax
	movabsq	$9223372036854775807, %r15      # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%r15, %rax
	cmovbq	%rax, %r15
	cmpq	%rax, %r12
	cmovaeq	%r12, %r15
	movq	%r15, %rdi
	incq	%rdi
	js	.LBB5_20
# %bb.10:                               #   in Loop: Header=BB5_3 Depth=2
	movq	%rcx, 8(%rsp)                   # 8-byte Spill
	callq	_Znwm@PLT
	movq	8(%rsp), %rdi                   # 8-byte Reload
	movq	(%rsp), %r8                     # 8-byte Reload
	movq	%rax, %rbp
	testq	%r13, %r13
	je	.LBB5_14
# %bb.11:                               #   in Loop: Header=BB5_3 Depth=2
	cmpq	$1, %r13
	jne	.LBB5_13
# %bb.12:                               #   in Loop: Header=BB5_3 Depth=2
	movzbl	(%rdi), %eax
	movb	%al, (%rbp)
.LBB5_14:                               #   in Loop: Header=BB5_3 Depth=2
	cmpq	%r8, %rdi
	je	.LBB5_16
.LBB5_15:                               #   in Loop: Header=BB5_3 Depth=2
	callq	_ZdlPv@PLT
	movq	(%rsp), %r8                     # 8-byte Reload
.LBB5_16:                               #   in Loop: Header=BB5_3 Depth=2
	movq	%rbp, (%rbx)
	movq	%r15, 16(%rbx)
	jmp	.LBB5_17
.LBB5_13:                               #   in Loop: Header=BB5_3 Depth=2
	movq	%rbp, %rdi
	movq	8(%rsp), %rsi                   # 8-byte Reload
	movq	%r13, %rdx
	callq	memcpy@PLT
	movq	8(%rsp), %rdi                   # 8-byte Reload
	movq	(%rsp), %r8                     # 8-byte Reload
	cmpq	%r8, %rdi
	jne	.LBB5_15
	jmp	.LBB5_16
.LBB5_19:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB5_20:
	.cfi_def_cfa_offset 96
	callq	_ZSt17__throw_bad_allocv@PLT
.LBB5_6:
	leaq	.L.str.3(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Lfunc_end5:
	.size	_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE, .Lfunc_end5-_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE,"axG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EEC5ERKN5NStat9TPredStatE,comdat
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE # -- Begin function _ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE
	.p2align	4, 0x90
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE,@function
_ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE: # @_ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE
.Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception2
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r12
	movq	%rdi, %r14
	leaq	_ZTVN8NDecoder16TPredHuffDecoderILm8EEE+16(%rip), %rax
	movq	%rax, (%rdi)
	addq	$8, %rdi
	movl	$65536, %edx                    # imm = 0x10000
	callq	memcpy@PLT
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, 65544(%r14)
	vmovups	%xmm0, 65554(%r14)
	leaq	65544(%r14), %rax
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	65536(%r12), %r13
	movq	65544(%r12), %r15
	movq	%r15, %rdi
	subq	%r13, %rdi
	movq	%rdi, %rbx
	sarq	$11, %rbx
	movq	%rbx, %rax
	shrq	$60, %rax
	jne	.LBB6_29
# %bb.1:
	cmpq	%r13, %r15
	je	.LBB6_4
# %bb.2:
	sarq	$8, %rdi
.Ltmp26:
	callq	_Znwm@PLT
.Ltmp27:
# %bb.3:
	movq	%rax, 65544(%r14)
	movq	%rax, 65552(%r14)
	leaq	(%rax,%rbx,8), %rax
	movq	%rax, 65560(%r14)
	movq	65536(%r12), %r13
	movq	65544(%r12), %r15
.LBB6_4:
	cmpq	%r15, %r13
	je	.LBB6_26
# %bb.5:
	movq	%r14, 16(%rsp)                  # 8-byte Spill
	movq	%r15, 8(%rsp)                   # 8-byte Spill
	jmp	.LBB6_7
	.p2align	4, 0x90
.LBB6_6:                                #   in Loop: Header=BB6_7 Depth=1
	movq	%rbp, (%rbx)
	addq	$8, 65552(%r14)
	addq	$2048, %r13                     # imm = 0x800
	cmpq	%r15, %r13
	je	.LBB6_26
.LBB6_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_20 Depth 2
                                        #     Child Loop BB6_22 Depth 2
.Ltmp28:
	movl	$4872, %edi                     # imm = 0x1308
	vzeroupper
	callq	_Znwm@PLT
.Ltmp29:
# %bb.8:                                #   in Loop: Header=BB6_7 Depth=1
.Ltmp31:
	movq	%rax, %rbp
	movl	$256, %edx                      # imm = 0x100
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	_ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE
.Ltmp32:
# %bb.9:                                #   in Loop: Header=BB6_7 Depth=1
	movq	65552(%r14), %rbx
	cmpq	65560(%r14), %rbx
	jne	.LBB6_6
# %bb.10:                               #   in Loop: Header=BB6_7 Depth=1
	movq	(%rsp), %rax                    # 8-byte Reload
	movq	(%rax), %r12
	movq	%rbx, %r15
	subq	%r12, %r15
	movabsq	$9223372036854775800, %rax      # imm = 0x7FFFFFFFFFFFFFF8
	cmpq	%rax, %r15
	je	.LBB6_27
# %bb.11:                               #   in Loop: Header=BB6_7 Depth=1
	movq	%r13, 32(%rsp)                  # 8-byte Spill
	movq	%r15, %r14
	sarq	$3, %r14
	cmpq	$1, %r14
	movq	%r14, %rax
	adcq	$0, %rax
	leaq	(%rax,%r14), %rdx
	movabsq	$1152921504606846975, %rcx      # imm = 0xFFFFFFFFFFFFFFF
	cmpq	%rcx, %rdx
	cmovaeq	%rcx, %rdx
	addq	%r14, %rax
	cmovbq	%rcx, %rdx
	testq	%rdx, %rdx
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	je	.LBB6_14
# %bb.12:                               #   in Loop: Header=BB6_7 Depth=1
	leaq	(,%rdx,8), %rdi
.Ltmp34:
	callq	_Znwm@PLT
.Ltmp35:
# %bb.13:                               #   in Loop: Header=BB6_7 Depth=1
	movq	%rax, %r13
	jmp	.LBB6_15
.LBB6_14:                               #   in Loop: Header=BB6_7 Depth=1
	xorl	%r13d, %r13d
.LBB6_15:                               #   in Loop: Header=BB6_7 Depth=1
	movq	%rbp, (%r13,%r14,8)
	movq	%r13, %rbp
	cmpq	%rbx, %r12
	movq	16(%rsp), %r14                  # 8-byte Reload
	je	.LBB6_23
# %bb.16:                               #   in Loop: Header=BB6_7 Depth=1
	addq	$-8, %r15
	movq	%r13, %rbp
	movq	%r12, %rax
	cmpq	$120, %r15
	jb	.LBB6_22
# %bb.17:                               #   in Loop: Header=BB6_7 Depth=1
	movq	%r15, %rax
	andq	$-8, %rax
	leaq	8(%r12,%rax), %rcx
	cmpq	%rcx, %r13
	jae	.LBB6_19
# %bb.18:                               #   in Loop: Header=BB6_7 Depth=1
	leaq	8(%r13,%rax), %rcx
	movq	%r13, %rbp
	movq	%r12, %rax
	cmpq	%rcx, %r12
	jb	.LBB6_22
.LBB6_19:                               #   in Loop: Header=BB6_7 Depth=1
	shrq	$3, %r15
	incq	%r15
	movq	%r15, %rcx
	andq	$-16, %rcx
	leaq	(%r13,%rcx,8), %rbp
	leaq	(%r12,%rcx,8), %rax
	xorl	%edx, %edx
	vxorps	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB6_20:                               #   Parent Loop BB6_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovups	(%r12,%rdx,8), %ymm0
	vmovups	32(%r12,%rdx,8), %ymm1
	vmovups	64(%r12,%rdx,8), %ymm2
	vmovups	96(%r12,%rdx,8), %ymm3
	vmovups	%ymm0, (%r13,%rdx,8)
	vmovups	%ymm1, 32(%r13,%rdx,8)
	vmovups	%ymm2, 64(%r13,%rdx,8)
	vmovups	%ymm3, 96(%r13,%rdx,8)
	vmovups	%ymm4, (%r12,%rdx,8)
	vmovups	%ymm4, 32(%r12,%rdx,8)
	vmovups	%ymm4, 64(%r12,%rdx,8)
	vmovups	%ymm4, 96(%r12,%rdx,8)
	addq	$16, %rdx
	cmpq	%rdx, %rcx
	jne	.LBB6_20
# %bb.21:                               #   in Loop: Header=BB6_7 Depth=1
	cmpq	%rcx, %r15
	je	.LBB6_23
	.p2align	4, 0x90
.LBB6_22:                               #   Parent Loop BB6_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	(%rax), %rcx
	movq	%rcx, (%rbp)
	movq	$0, (%rax)
	addq	$8, %rax
	addq	$8, %rbp
	cmpq	%rbx, %rax
	jne	.LBB6_22
.LBB6_23:                               #   in Loop: Header=BB6_7 Depth=1
	testq	%r12, %r12
	je	.LBB6_25
# %bb.24:                               #   in Loop: Header=BB6_7 Depth=1
	movq	%r12, %rdi
	vzeroupper
	callq	_ZdlPv@PLT
.LBB6_25:                               #   in Loop: Header=BB6_7 Depth=1
	addq	$8, %rbp
	movq	%r13, 65544(%r14)
	movq	%rbp, 65552(%r14)
	movq	24(%rsp), %rax                  # 8-byte Reload
	leaq	(%r13,%rax,8), %rax
	movq	%rax, 65560(%r14)
	movq	32(%rsp), %r13                  # 8-byte Reload
	movq	8(%rsp), %r15                   # 8-byte Reload
	addq	$2048, %r13                     # imm = 0x800
	cmpq	%r15, %r13
	jne	.LBB6_7
.LBB6_26:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	retq
.LBB6_27:
	.cfi_def_cfa_offset 96
.Ltmp37:
	leaq	.L.str.2(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp38:
# %bb.28:
.LBB6_29:
.Ltmp40:
	leaq	.L.str.4(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp41:
# %bb.30:
.LBB6_31:
.Ltmp42:
	jmp	.LBB6_36
.LBB6_32:
.Ltmp36:
	jmp	.LBB6_34
.LBB6_33:
.Ltmp39:
.LBB6_34:
	movq	%rax, %r14
	movq	(%rbp), %rax
	movq	%rbp, %rdi
	callq	*8(%rax)
	movq	(%rsp), %rdi                    # 8-byte Reload
	callq	_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev
	movq	%r14, %rdi
	callq	_Unwind_Resume@PLT
.LBB6_35:
.Ltmp30:
.LBB6_36:
	movq	%rax, %r14
	movq	(%rsp), %rdi                    # 8-byte Reload
	callq	_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev
	movq	%r14, %rdi
	callq	_Unwind_Resume@PLT
.LBB6_37:
.Ltmp33:
	movq	%rax, %r14
	movq	%rbp, %rdi
	callq	_ZdlPv@PLT
	movq	(%rsp), %rdi                    # 8-byte Reload
	callq	_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev
	movq	%r14, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end6:
	.size	_ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE, .Lfunc_end6-_ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE
	.cfi_endproc
	.section	.gcc_except_table._ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE,"aG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EEC5ERKN5NStat9TPredStatE,comdat
	.p2align	2, 0x0
GCC_except_table6:
.Lexception2:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end2-.Lcst_begin2
.Lcst_begin2:
	.uleb128 .Lfunc_begin2-.Lfunc_begin2    # >> Call Site 1 <<
	.uleb128 .Ltmp26-.Lfunc_begin2          #   Call between .Lfunc_begin2 and .Ltmp26
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp26-.Lfunc_begin2          # >> Call Site 2 <<
	.uleb128 .Ltmp27-.Ltmp26                #   Call between .Ltmp26 and .Ltmp27
	.uleb128 .Ltmp42-.Lfunc_begin2          #     jumps to .Ltmp42
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp28-.Lfunc_begin2          # >> Call Site 3 <<
	.uleb128 .Ltmp29-.Ltmp28                #   Call between .Ltmp28 and .Ltmp29
	.uleb128 .Ltmp30-.Lfunc_begin2          #     jumps to .Ltmp30
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp31-.Lfunc_begin2          # >> Call Site 4 <<
	.uleb128 .Ltmp32-.Ltmp31                #   Call between .Ltmp31 and .Ltmp32
	.uleb128 .Ltmp33-.Lfunc_begin2          #     jumps to .Ltmp33
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp34-.Lfunc_begin2          # >> Call Site 5 <<
	.uleb128 .Ltmp35-.Ltmp34                #   Call between .Ltmp34 and .Ltmp35
	.uleb128 .Ltmp36-.Lfunc_begin2          #     jumps to .Ltmp36
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp37-.Lfunc_begin2          # >> Call Site 6 <<
	.uleb128 .Ltmp38-.Ltmp37                #   Call between .Ltmp37 and .Ltmp38
	.uleb128 .Ltmp39-.Lfunc_begin2          #     jumps to .Ltmp39
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp40-.Lfunc_begin2          # >> Call Site 7 <<
	.uleb128 .Ltmp41-.Ltmp40                #   Call between .Ltmp40 and .Ltmp41
	.uleb128 .Ltmp42-.Lfunc_begin2          #     jumps to .Ltmp42
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp41-.Lfunc_begin2          # >> Call Site 8 <<
	.uleb128 .Lfunc_end6-.Ltmp41            #   Call between .Ltmp41 and .Lfunc_end6
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end2:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text._ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev,"axG",@progbits,_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev,comdat
	.weak	_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev # -- Begin function _ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev
	.p2align	4, 0x90
	.type	_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev,@function
_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev: # @_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	(%rdi), %rbx
	movq	8(%rdi), %r15
	cmpq	%r15, %rbx
	je	.LBB7_6
# %bb.1:
	movq	%rdi, %r14
	jmp	.LBB7_2
	.p2align	4, 0x90
.LBB7_4:                                #   in Loop: Header=BB7_2 Depth=1
	movq	$0, (%rbx)
	addq	$8, %rbx
	cmpq	%r15, %rbx
	je	.LBB7_5
.LBB7_2:                                # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB7_4
# %bb.3:                                #   in Loop: Header=BB7_2 Depth=1
	movq	(%rdi), %rax
	callq	*8(%rax)
	jmp	.LBB7_4
.LBB7_5:
	movq	(%r14), %rbx
.LBB7_6:
	testq	%rbx, %rbx
	je	.LBB7_7
# %bb.8:
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT                      # TAILCALL
.LBB7_7:
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev, .Lfunc_end7-_ZNSt6vectorISt10unique_ptrIN8NDecoder12THuffDecoderILm8EEESt14default_deleteIS3_EESaIS6_EED2Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm,"axG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm,comdat
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm # -- Begin function _ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.p2align	4, 0x90
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm,@function
_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm: # @_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movzwl	65568(%rdi), %eax
	movzbl	8(%rdi,%rax), %eax
	movq	65544(%rdi), %rdi
	movq	(%rdi,%rax,8), %rdi
	movq	(%rdi), %rax
	callq	*16(%rax)
	movl	65568(%rbx), %ecx
	shll	$8, %ecx
	movzbl	%al, %eax
	orl	%eax, %ecx
	movw	%cx, 65568(%rbx)
                                        # kill: def $al killed $al killed $eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm, .Lfunc_end8-_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt,"axG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt,comdat
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt # -- Begin function _ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt
	.p2align	4, 0x90
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt,@function
_ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt: # @_ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt
	.cfi_startproc
# %bb.0:
	movl	%esi, %eax
	movzbl	8(%rdi,%rax), %eax
	movq	65544(%rdi), %rcx
	movq	(%rcx,%rax,8), %rax
	retq
.Lfunc_end9:
	.size	_ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt, .Lfunc_end9-_ZN8NDecoder16TPredHuffDecoderILm8EE10GetHuffmanEt
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,"axG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,comdat
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE # -- Begin function _ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
	.p2align	4, 0x90
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,@function
_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE: # @_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
.Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception3
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	leaq	24(%rsp), %rax
	movq	%rax, 8(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 24(%rsp)
	movq	$0, 40(%rsp)
	movl	$0, 48(%rsp)
	movb	$61, %al
	bzhiq	%rax, %rdx, %rax
	cmpq	$15, %rax
	jb	.LBB10_8
# %bb.1:
	cmpq	$30, %rax
	movl	$29, %r13d
	cmovaeq	%rax, %r13
	leaq	2(%r13), %rdi
.Ltmp43:
	callq	_Znwm@PLT
.Ltmp44:
# %bb.2:
	incq	%r13
	movb	$0, (%rax)
	movq	%rax, 8(%rsp)
	movq	%r13, 24(%rsp)
	jmp	.LBB10_3
.LBB10_8:
	testq	%r15, %r15
	je	.LBB10_9
.LBB10_3:
	xorl	%ebp, %ebp
	leaq	8(%rsp), %r13
	.p2align	4, 0x90
.LBB10_4:                               # =>This Inner Loop Header: Depth=1
	movzwl	%bp, %eax
	movzbl	8(%r12,%rax), %eax
	movq	65544(%r12), %rcx
	movq	(%rcx,%rax,8), %rdi
.Ltmp46:
	movl	$1, %esi
	movq	%r14, %rdx
	movq	%r13, %rcx
	callq	_ZN8NDecoder12THuffDecoderILm8EE13BufferedWriteESt17basic_string_viewIcSt11char_traitsIcEERNS_10TWriteDataE
.Ltmp47:
# %bb.5:                                #   in Loop: Header=BB10_4 Depth=1
	shll	$8, %ebp
	movzbl	(%r14), %eax
	orl	%ebp, %eax
	incq	%r14
	movl	%eax, %ebp
	decq	%r15
	jne	.LBB10_4
# %bb.6:
	movq	8(%rsp), %r14
	movq	16(%rsp), %r12
	movslq	48(%rsp), %r13
	testq	%r13, %r13
	jle	.LBB10_7
# %bb.11:
	leaq	1(%r12), %r15
	movl	$15, %eax
	leaq	24(%rsp), %rcx
	cmpq	%rcx, %r14
	je	.LBB10_13
# %bb.12:
	movq	24(%rsp), %rax
.LBB10_13:
	movzbl	40(%rsp), %ebp
	cmpq	%rax, %r15
	jbe	.LBB10_16
# %bb.14:
.Ltmp49:
	leaq	8(%rsp), %rdi
	movl	$1, %r8d
	movq	%r12, %rsi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	callq	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
.Ltmp50:
# %bb.15:
	movq	8(%rsp), %r14
.LBB10_16:
	movb	%bpl, (%r14,%r12)
	movq	%r15, 16(%rsp)
	movq	8(%rsp), %rax
	movb	$0, 1(%rax,%r12)
	movq	8(%rsp), %r14
	movq	16(%rsp), %r15
	jmp	.LBB10_17
.LBB10_7:
	movq	%r12, %r15
.LBB10_17:
	leaq	(%r13,%r12,8), %rax
	movq	%rax, (%rbx)
	leaq	24(%rbx), %r12
	movq	%r12, 8(%rbx)
	cmpq	$16, %r15
	jb	.LBB10_26
# %bb.18:
	testq	%r15, %r15
	js	.LBB10_19
# %bb.21:
	movq	%r15, %rdi
	incq	%rdi
	js	.LBB10_22
# %bb.24:
.Ltmp51:
	callq	_Znwm@PLT
.Ltmp52:
# %bb.25:
	movq	%rax, %r12
	movq	%rax, 8(%rbx)
	movq	%r15, 24(%rbx)
.LBB10_26:
	testq	%r15, %r15
	je	.LBB10_30
# %bb.27:
	cmpq	$1, %r15
	jne	.LBB10_29
# %bb.28:
	movzbl	(%r14), %eax
	movb	%al, (%r12)
	movl	$1, %r15d
	jmp	.LBB10_30
.LBB10_29:
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	memcpy@PLT
.LBB10_30:
	movq	%r15, 16(%rbx)
	movb	$0, (%r12,%r15)
	leaq	24(%rsp), %rax
	cmpq	%rax, %r14
	je	.LBB10_32
# %bb.31:
	movq	%r14, %rdi
	callq	_ZdlPv@PLT
	jmp	.LBB10_32
.LBB10_9:
	movq	$0, (%rbx)
	leaq	24(%rbx), %rax
	movq	%rax, 8(%rbx)
	movq	$0, 16(%rbx)
	movb	$0, 24(%rbx)
.LBB10_32:
	movq	%rbx, %rax
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB10_22:
	.cfi_def_cfa_offset 112
.Ltmp53:
	callq	_ZSt17__throw_bad_allocv@PLT
.Ltmp54:
# %bb.23:
.LBB10_19:
.Ltmp55:
	leaq	.L.str.3(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Ltmp56:
# %bb.20:
.LBB10_33:
.Ltmp45:
	jmp	.LBB10_34
.LBB10_10:
.Ltmp48:
	jmp	.LBB10_34
.LBB10_37:
.Ltmp57:
.LBB10_34:
	movq	%rax, %rbx
	movq	8(%rsp), %rdi
	leaq	24(%rsp), %rax
	cmpq	%rax, %rdi
	je	.LBB10_36
# %bb.35:
	callq	_ZdlPv@PLT
.LBB10_36:
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end10:
	.size	_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE, .Lfunc_end10-_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
	.cfi_endproc
	.section	.gcc_except_table._ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,"aG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE,comdat
	.p2align	2, 0x0
GCC_except_table10:
.Lexception3:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end3-.Lcst_begin3
.Lcst_begin3:
	.uleb128 .Ltmp43-.Lfunc_begin3          # >> Call Site 1 <<
	.uleb128 .Ltmp44-.Ltmp43                #   Call between .Ltmp43 and .Ltmp44
	.uleb128 .Ltmp45-.Lfunc_begin3          #     jumps to .Ltmp45
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp46-.Lfunc_begin3          # >> Call Site 2 <<
	.uleb128 .Ltmp47-.Ltmp46                #   Call between .Ltmp46 and .Ltmp47
	.uleb128 .Ltmp48-.Lfunc_begin3          #     jumps to .Ltmp48
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp49-.Lfunc_begin3          # >> Call Site 3 <<
	.uleb128 .Ltmp52-.Ltmp49                #   Call between .Ltmp49 and .Ltmp52
	.uleb128 .Ltmp57-.Lfunc_begin3          #     jumps to .Ltmp57
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp52-.Lfunc_begin3          # >> Call Site 4 <<
	.uleb128 .Ltmp53-.Ltmp52                #   Call between .Ltmp52 and .Ltmp53
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp53-.Lfunc_begin3          # >> Call Site 5 <<
	.uleb128 .Ltmp56-.Ltmp53                #   Call between .Ltmp53 and .Ltmp56
	.uleb128 .Ltmp57-.Lfunc_begin3          #     jumps to .Ltmp57
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp56-.Lfunc_begin3          # >> Call Site 6 <<
	.uleb128 .Lfunc_end10-.Ltmp56           #   Call between .Ltmp56 and .Lfunc_end10
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end3:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text._ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv,"axG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv,comdat
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv # -- Begin function _ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv
	.p2align	4, 0x90
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv,@function
_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv: # @_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv
	.cfi_startproc
# %bb.0:
	movw	$0, 65568(%rdi)
	retq
.Lfunc_end11:
	.size	_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv, .Lfunc_end11-_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv,"axG",@progbits,_ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv,comdat
	.weak	_ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv # -- Begin function _ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv
	.p2align	4, 0x90
	.type	_ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv,@function
_ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv: # @_ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv
	.cfi_startproc
# %bb.0:
	movq	65552(%rdi), %rax
	subq	65544(%rdi), %rax
	sarq	$3, %rax
	retq
.Lfunc_end12:
	.size	_ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv, .Lfunc_end12-_ZNK8NDecoder16TPredHuffDecoderILm8EE16GetClustersCountEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8IDecoderD2Ev,"axG",@progbits,_ZN8IDecoderD2Ev,comdat
	.weak	_ZN8IDecoderD2Ev                # -- Begin function _ZN8IDecoderD2Ev
	.p2align	4, 0x90
	.type	_ZN8IDecoderD2Ev,@function
_ZN8IDecoderD2Ev:                       # @_ZN8IDecoderD2Ev
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end13:
	.size	_ZN8IDecoderD2Ev, .Lfunc_end13-_ZN8IDecoderD2Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder12THuffDecoderILm8EED0Ev,"axG",@progbits,_ZN8NDecoder12THuffDecoderILm8EED0Ev,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EED0Ev # -- Begin function _ZN8NDecoder12THuffDecoderILm8EED0Ev
	.p2align	4, 0x90
	.type	_ZN8NDecoder12THuffDecoderILm8EED0Ev,@function
_ZN8NDecoder12THuffDecoderILm8EED0Ev:   # @_ZN8NDecoder12THuffDecoderILm8EED0Ev
	.cfi_startproc
# %bb.0:
	jmp	_ZdlPv@PLT                      # TAILCALL
.Lfunc_end14:
	.size	_ZN8NDecoder12THuffDecoderILm8EED0Ev, .Lfunc_end14-_ZN8NDecoder12THuffDecoderILm8EED0Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8IDecoder5ResetEv,"axG",@progbits,_ZN8IDecoder5ResetEv,comdat
	.weak	_ZN8IDecoder5ResetEv            # -- Begin function _ZN8IDecoder5ResetEv
	.p2align	4, 0x90
	.type	_ZN8IDecoder5ResetEv,@function
_ZN8IDecoder5ResetEv:                   # @_ZN8IDecoder5ResetEv
	.cfi_startproc
# %bb.0:
	retq
.Lfunc_end15:
	.size	_ZN8IDecoder5ResetEv, .Lfunc_end15-_ZN8IDecoder5ResetEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder16TPredHuffDecoderILm8EED2Ev,"axG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev,comdat
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev # -- Begin function _ZN8NDecoder16TPredHuffDecoderILm8EED2Ev
	.p2align	4, 0x90
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev,@function
_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev: # @_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	_ZTVN8NDecoder16TPredHuffDecoderILm8EEE+16(%rip), %rax
	movq	%rax, (%rdi)
	movq	65544(%rdi), %rbx
	movq	65552(%rdi), %r15
	cmpq	%r15, %rbx
	je	.LBB16_6
# %bb.1:
	movq	%rdi, %r14
	jmp	.LBB16_2
	.p2align	4, 0x90
.LBB16_4:                               #   in Loop: Header=BB16_2 Depth=1
	movq	$0, (%rbx)
	addq	$8, %rbx
	cmpq	%r15, %rbx
	je	.LBB16_5
.LBB16_2:                               # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.LBB16_4
# %bb.3:                                #   in Loop: Header=BB16_2 Depth=1
	movq	(%rdi), %rax
	callq	*8(%rax)
	jmp	.LBB16_4
.LBB16_5:
	movq	65544(%r14), %rbx
.LBB16_6:
	testq	%rbx, %rbx
	je	.LBB16_7
# %bb.8:
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT                      # TAILCALL
.LBB16_7:
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end16:
	.size	_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev, .Lfunc_end16-_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN8NDecoder16TPredHuffDecoderILm8EED0Ev,"axG",@progbits,_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev,comdat
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev # -- Begin function _ZN8NDecoder16TPredHuffDecoderILm8EED0Ev
	.p2align	4, 0x90
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev,@function
_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev: # @_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	leaq	_ZTVN8NDecoder16TPredHuffDecoderILm8EEE+16(%rip), %rax
	movq	%rax, (%rdi)
	movq	65544(%rdi), %r14
	movq	65552(%rdi), %r15
	cmpq	%r15, %r14
	jne	.LBB17_1
# %bb.5:
	testq	%r14, %r14
	je	.LBB17_7
.LBB17_6:
	movq	%r14, %rdi
	callq	_ZdlPv@PLT
.LBB17_7:
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT                      # TAILCALL
	.p2align	4, 0x90
.LBB17_3:                               #   in Loop: Header=BB17_1 Depth=1
	.cfi_def_cfa_offset 32
	movq	$0, (%r14)
	addq	$8, %r14
	cmpq	%r15, %r14
	je	.LBB17_4
.LBB17_1:                               # =>This Inner Loop Header: Depth=1
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB17_3
# %bb.2:                                #   in Loop: Header=BB17_1 Depth=1
	movq	(%rdi), %rax
	callq	*8(%rax)
	jmp	.LBB17_3
.LBB17_4:
	movq	65544(%rbx), %r14
	testq	%r14, %r14
	jne	.LBB17_6
	jmp	.LBB17_7
.Lfunc_end17:
	.size	_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev, .Lfunc_end17-_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm,comdat
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm # -- Begin function _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
	.p2align	4, 0x90
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm,@function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm: # @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%r8, %rbp
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	(%rdi), %r14
	movq	8(%rdi), %r12
	movq	%r8, (%rsp)                     # 8-byte Spill
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	subq	%rdx, %rbp
	leaq	16(%rdi), %rcx
	movl	$15, %eax
	cmpq	%rcx, %r14
	je	.LBB18_2
# %bb.1:
	movq	16(%rbx), %rax
.LBB18_2:
	addq	%r12, %rbp
	js	.LBB18_25
# %bb.3:
	cmpq	%rax, %rbp
	jbe	.LBB18_6
# %bb.4:
	addq	%rax, %rax
	cmpq	%rax, %rbp
	jae	.LBB18_6
# %bb.5:
	movabsq	$9223372036854775807, %rbp      # imm = 0x7FFFFFFFFFFFFFFF
	cmpq	%rbp, %rax
	cmovbq	%rax, %rbp
.LBB18_6:
	movq	%rbp, %rdi
	incq	%rdi
	js	.LBB18_26
# %bb.7:
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	callq	_Znwm@PLT
	movq	%rax, %r13
	testq	%r15, %r15
	je	.LBB18_11
# %bb.8:
	cmpq	$1, %r15
	jne	.LBB18_10
# %bb.9:
	movzbl	(%r14), %eax
	movb	%al, (%r13)
	jmp	.LBB18_11
.LBB18_10:
	movq	%r13, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	memcpy@PLT
.LBB18_11:
	movq	%r14, 8(%rsp)                   # 8-byte Spill
	movq	16(%rsp), %rax                  # 8-byte Reload
	leaq	(%rax,%r15), %r14
	movq	32(%rsp), %rsi                  # 8-byte Reload
	testq	%rsi, %rsi
	movq	(%rsp), %rdx                    # 8-byte Reload
	je	.LBB18_17
# %bb.12:
	testq	%rdx, %rdx
	je	.LBB18_17
# %bb.13:
	leaq	(%r13,%r15), %rdi
	cmpq	$1, %rdx
	jne	.LBB18_15
# %bb.14:
	movzbl	(%rsi), %eax
	movb	%al, (%rdi)
	jmp	.LBB18_16
.LBB18_15:
	callq	memcpy@PLT
.LBB18_16:
	movq	(%rsp), %rdx                    # 8-byte Reload
.LBB18_17:
	cmpq	%r14, %r12
	je	.LBB18_22
# %bb.18:
	subq	%r14, %r12
	je	.LBB18_22
# %bb.19:
	movq	%r13, %rdi
	addq	%r15, %rdi
	addq	%rdx, %rdi
	addq	8(%rsp), %r15                   # 8-byte Folded Reload
	addq	16(%rsp), %r15                  # 8-byte Folded Reload
	cmpq	$1, %r12
	jne	.LBB18_21
# %bb.20:
	movzbl	(%r15), %eax
	movb	%al, (%rdi)
.LBB18_22:
	movq	8(%rsp), %rdi                   # 8-byte Reload
	cmpq	24(%rsp), %rdi                  # 8-byte Folded Reload
	je	.LBB18_24
.LBB18_23:
	callq	_ZdlPv@PLT
.LBB18_24:
	movq	%r13, (%rbx)
	movq	%rbp, 16(%rbx)
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB18_21:
	.cfi_def_cfa_offset 96
	movq	%r15, %rsi
	movq	%r12, %rdx
	callq	memcpy@PLT
	movq	8(%rsp), %rdi                   # 8-byte Reload
	cmpq	24(%rsp), %rdi                  # 8-byte Folded Reload
	jne	.LBB18_23
	jmp	.LBB18_24
.LBB18_26:
	callq	_ZSt17__throw_bad_allocv@PLT
.LBB18_25:
	leaq	.L.str.3(%rip), %rdi
	callq	_ZSt20__throw_length_errorPKc@PLT
.Lfunc_end18:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm, .Lfunc_end18-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm
	.cfi_endproc
                                        # -- End function
	.section	.text._ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_,"axG",@progbits,_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_,comdat
	.weak	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_ # -- Begin function _ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_
	.p2align	4, 0x90
	.type	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_,@function
_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_: # @_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	-1(%rdx), %rax
	shrq	$63, %rax
	leaq	-1(%rdx,%rax), %r9
	sarq	%r9
	movq	%rsi, %rax
	cmpq	%rsi, %r9
	jle	.LBB19_7
# %bb.1:
	xorl	%r10d, %r10d
	movq	%rsi, %r11
	jmp	.LBB19_3
	.p2align	4, 0x90
.LBB19_6:                               #   in Loop: Header=BB19_3 Depth=1
	movq	%rbx, %rax
.LBB19_2:                               #   in Loop: Header=BB19_3 Depth=1
	movq	%rax, %rbx
	shlq	$4, %rbx
	shlq	$4, %r11
	vmovups	(%rdi,%rbx), %xmm0
	vmovups	%xmm0, (%rdi,%r11)
	movq	%rax, %r11
	cmpq	%r9, %rax
	jge	.LBB19_7
.LBB19_3:                               # =>This Inner Loop Header: Depth=1
	leaq	2(%r11,%r11), %rbx
	movq	%rbx, %r14
	shlq	$4, %r14
	leaq	1(%r11,%r11), %rax
	movq	%rax, %r15
	shlq	$4, %r15
	movq	(%rdi,%r14), %r12
	movq	(%rdi,%r15), %r13
	cmpq	%r13, %r12
	movl	$0, %ebp
	sbbl	%ebp, %ebp
	cmpq	%r13, %r12
	jne	.LBB19_5
# %bb.4:                                #   in Loop: Header=BB19_3 Depth=1
	movzwl	8(%rdi,%r14), %ebp
	movzwl	8(%rdi,%r15), %r14d
	cmpw	%r14w, %bp
	movl	$0, %r15d
	sbbl	%r15d, %r15d
	orb	$1, %r15b
	cmpw	%r14w, %bp
	movzbl	%r15b, %ebp
	cmovel	%r10d, %ebp
	testb	%bpl, %bpl
	jg	.LBB19_2
	jmp	.LBB19_6
	.p2align	4, 0x90
.LBB19_5:                               #   in Loop: Header=BB19_3 Depth=1
	orb	$1, %bpl
	testb	%bpl, %bpl
	jg	.LBB19_2
	jmp	.LBB19_6
.LBB19_7:
	testb	$1, %dl
	jne	.LBB19_10
# %bb.8:
	addq	$-2, %rdx
	sarq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB19_10
# %bb.9:
	leaq	1(%rax,%rax), %rdx
	movq	%rdx, %r9
	shlq	$4, %r9
	shlq	$4, %rax
	vmovups	(%rdi,%r9), %xmm0
	vmovups	%xmm0, (%rdi,%rax)
	movq	%rdx, %rax
.LBB19_10:
	cmpq	%rsi, %rax
	jle	.LBB19_17
	.p2align	4, 0x90
.LBB19_11:                              # =>This Inner Loop Header: Depth=1
	leaq	-1(%rax), %rdx
	shrq	$63, %rdx
	leaq	-1(%rax,%rdx), %rdx
	sarq	%rdx
	movq	%rdx, %r9
	shlq	$4, %r9
	movq	(%rdi,%r9), %r11
	cmpq	%rcx, %r11
	movl	$0, %r10d
	sbbl	%r10d, %r10d
	cmpq	%rcx, %r11
	jne	.LBB19_13
# %bb.12:                               #   in Loop: Header=BB19_11 Depth=1
	movzwl	8(%rdi,%r9), %r11d
	cmpw	%r8w, %r11w
	movl	$0, %r10d
	sbbl	%r10d, %r10d
	cmpw	%r8w, %r11w
	je	.LBB19_17
.LBB19_13:                              #   in Loop: Header=BB19_11 Depth=1
	orb	$1, %r10b
	testb	%r10b, %r10b
	jle	.LBB19_17
# %bb.14:                               #   in Loop: Header=BB19_11 Depth=1
	addq	%rdi, %r9
	shlq	$4, %rax
	vmovups	(%r9), %xmm0
	vmovups	%xmm0, (%rdi,%rax)
	movq	%rdx, %rax
	cmpq	%rsi, %rdx
	jg	.LBB19_11
	jmp	.LBB19_18
.LBB19_17:
	movq	%rax, %rdx
.LBB19_18:
	shlq	$4, %rdx
	movq	%rcx, (%rdi,%rdx)
	movw	%r8w, 8(%rdi,%rdx)
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_, .Lfunc_end19-_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EEE1TSt6vectorIS8_SaIS8_EEEElS8_NS0_5__ops15_Iter_comp_iterISt7greaterIvEEEEvT_T0_SK_T1_T2_
	.cfi_endproc
                                        # -- End function
	.type	_ZTVN8NDecoder12THuffDecoderILm8EEE,@object # @_ZTVN8NDecoder12THuffDecoderILm8EEE
	.section	.data.rel.ro._ZTVN8NDecoder12THuffDecoderILm8EEE,"awG",@progbits,_ZTVN8NDecoder12THuffDecoderILm8EEE,comdat
	.weak	_ZTVN8NDecoder12THuffDecoderILm8EEE
	.p2align	3, 0x0
_ZTVN8NDecoder12THuffDecoderILm8EEE:
	.quad	0
	.quad	_ZTIN8NDecoder12THuffDecoderILm8EEE
	.quad	_ZN8IDecoderD2Ev
	.quad	_ZN8NDecoder12THuffDecoderILm8EED0Ev
	.quad	_ZN8NDecoder12THuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.quad	_ZN8NDecoder12THuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
	.quad	_ZN8IDecoder5ResetEv
	.size	_ZTVN8NDecoder12THuffDecoderILm8EEE, 56

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"q.size() == 1"
	.size	.L.str, 14

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"huffman.cpp"
	.size	.L.str.1, 12

	.type	.L__PRETTY_FUNCTION__._ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE,@object # @__PRETTY_FUNCTION__._ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE
.L__PRETTY_FUNCTION__._ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE:
	.asciz	"NDecoder::THuffDecoder<8>::THuffDecoder(const std::span<const uint64_t>) [TABLE_BITS = 8]"
	.size	.L__PRETTY_FUNCTION__._ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE, 90

	.type	_ZN8NDecoder12THuffDecoderILm8EE2SZE,@object # @_ZN8NDecoder12THuffDecoderILm8EE2SZE
	.section	.rodata._ZN8NDecoder12THuffDecoderILm8EE2SZE,"aG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE2SZE,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EE2SZE
	.p2align	3, 0x0
_ZN8NDecoder12THuffDecoderILm8EE2SZE:
	.quad	511                             # 0x1ff
	.size	_ZN8NDecoder12THuffDecoderILm8EE2SZE, 8

	.type	_ZN8NDecoder12THuffDecoderILm8EE10TABLE_SIZEE,@object # @_ZN8NDecoder12THuffDecoderILm8EE10TABLE_SIZEE
	.section	.rodata._ZN8NDecoder12THuffDecoderILm8EE10TABLE_SIZEE,"aG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE10TABLE_SIZEE,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EE10TABLE_SIZEE
	.p2align	3, 0x0
_ZN8NDecoder12THuffDecoderILm8EE10TABLE_SIZEE:
	.quad	256                             # 0x100
	.size	_ZN8NDecoder12THuffDecoderILm8EE10TABLE_SIZEE, 8

	.type	_ZN8NDecoder12THuffDecoderILm8EE10TABLE_MASKE,@object # @_ZN8NDecoder12THuffDecoderILm8EE10TABLE_MASKE
	.section	.rodata._ZN8NDecoder12THuffDecoderILm8EE10TABLE_MASKE,"aG",@progbits,_ZN8NDecoder12THuffDecoderILm8EE10TABLE_MASKE,comdat
	.weak	_ZN8NDecoder12THuffDecoderILm8EE10TABLE_MASKE
	.p2align	3, 0x0
_ZN8NDecoder12THuffDecoderILm8EE10TABLE_MASKE:
	.quad	255                             # 0xff
	.size	_ZN8NDecoder12THuffDecoderILm8EE10TABLE_MASKE, 8

	.type	_ZTVN8NDecoder16TPredHuffDecoderILm8EEE,@object # @_ZTVN8NDecoder16TPredHuffDecoderILm8EEE
	.section	.data.rel.ro._ZTVN8NDecoder16TPredHuffDecoderILm8EEE,"awG",@progbits,_ZTVN8NDecoder16TPredHuffDecoderILm8EEE,comdat
	.weak	_ZTVN8NDecoder16TPredHuffDecoderILm8EEE
	.p2align	3, 0x0
_ZTVN8NDecoder16TPredHuffDecoderILm8EEE:
	.quad	0
	.quad	_ZTIN8NDecoder16TPredHuffDecoderILm8EEE
	.quad	_ZN8NDecoder16TPredHuffDecoderILm8EED2Ev
	.quad	_ZN8NDecoder16TPredHuffDecoderILm8EED0Ev
	.quad	_ZN8NDecoder16TPredHuffDecoderILm8EE7GetNextESt17basic_string_viewIcSt11char_traitsIcEERm
	.quad	_ZN8NDecoder16TPredHuffDecoderILm8EE5WriteB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEE
	.quad	_ZN8NDecoder16TPredHuffDecoderILm8EE5ResetEv
	.size	_ZTVN8NDecoder16TPredHuffDecoderILm8EEE, 56

	.type	_ZTSN8NDecoder12THuffDecoderILm8EEE,@object # @_ZTSN8NDecoder12THuffDecoderILm8EEE
	.section	.rodata._ZTSN8NDecoder12THuffDecoderILm8EEE,"aG",@progbits,_ZTSN8NDecoder12THuffDecoderILm8EEE,comdat
	.weak	_ZTSN8NDecoder12THuffDecoderILm8EEE
_ZTSN8NDecoder12THuffDecoderILm8EEE:
	.asciz	"N8NDecoder12THuffDecoderILm8EEE"
	.size	_ZTSN8NDecoder12THuffDecoderILm8EEE, 32

	.type	_ZTS8IDecoder,@object           # @_ZTS8IDecoder
	.section	.rodata._ZTS8IDecoder,"aG",@progbits,_ZTS8IDecoder,comdat
	.weak	_ZTS8IDecoder
_ZTS8IDecoder:
	.asciz	"8IDecoder"
	.size	_ZTS8IDecoder, 10

	.type	_ZTI8IDecoder,@object           # @_ZTI8IDecoder
	.section	.data.rel.ro._ZTI8IDecoder,"awG",@progbits,_ZTI8IDecoder,comdat
	.weak	_ZTI8IDecoder
	.p2align	3, 0x0
_ZTI8IDecoder:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS8IDecoder
	.size	_ZTI8IDecoder, 16

	.type	_ZTIN8NDecoder12THuffDecoderILm8EEE,@object # @_ZTIN8NDecoder12THuffDecoderILm8EEE
	.section	.data.rel.ro._ZTIN8NDecoder12THuffDecoderILm8EEE,"awG",@progbits,_ZTIN8NDecoder12THuffDecoderILm8EEE,comdat
	.weak	_ZTIN8NDecoder12THuffDecoderILm8EEE
	.p2align	3, 0x0
_ZTIN8NDecoder12THuffDecoderILm8EEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSN8NDecoder12THuffDecoderILm8EEE
	.quad	_ZTI8IDecoder
	.size	_ZTIN8NDecoder12THuffDecoderILm8EEE, 24

	.type	_ZTSN8NDecoder16TPredHuffDecoderILm8EEE,@object # @_ZTSN8NDecoder16TPredHuffDecoderILm8EEE
	.section	.rodata._ZTSN8NDecoder16TPredHuffDecoderILm8EEE,"aG",@progbits,_ZTSN8NDecoder16TPredHuffDecoderILm8EEE,comdat
	.weak	_ZTSN8NDecoder16TPredHuffDecoderILm8EEE
_ZTSN8NDecoder16TPredHuffDecoderILm8EEE:
	.asciz	"N8NDecoder16TPredHuffDecoderILm8EEE"
	.size	_ZTSN8NDecoder16TPredHuffDecoderILm8EEE, 36

	.type	_ZTIN8NDecoder16TPredHuffDecoderILm8EEE,@object # @_ZTIN8NDecoder16TPredHuffDecoderILm8EEE
	.section	.data.rel.ro._ZTIN8NDecoder16TPredHuffDecoderILm8EEE,"awG",@progbits,_ZTIN8NDecoder16TPredHuffDecoderILm8EEE,comdat
	.weak	_ZTIN8NDecoder16TPredHuffDecoderILm8EEE
	.p2align	3, 0x0
_ZTIN8NDecoder16TPredHuffDecoderILm8EEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSN8NDecoder16TPredHuffDecoderILm8EEE
	.quad	_ZTI8IDecoder
	.size	_ZTIN8NDecoder16TPredHuffDecoderILm8EEE, 24

	.type	.L.str.2,@object                # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"vector::_M_realloc_insert"
	.size	.L.str.2, 26

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"basic_string::_M_create"
	.size	.L.str.3, 24

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"vector::reserve"
	.size	.L.str.4, 16

	.section	".linker-options","e",@llvm_linker_options
	.weak	_ZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EE
	.type	_ZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EE,@function
.set _ZN8NDecoder12THuffDecoderILm8EEC1ESt4spanIKmLm18446744073709551615EE, _ZN8NDecoder12THuffDecoderILm8EEC2ESt4spanIKmLm18446744073709551615EE
	.weak	_ZN8NDecoder16TPredHuffDecoderILm8EEC1ERKN5NStat9TPredStatE
	.type	_ZN8NDecoder16TPredHuffDecoderILm8EEC1ERKN5NStat9TPredStatE,@function
.set _ZN8NDecoder16TPredHuffDecoderILm8EEC1ERKN5NStat9TPredStatE, _ZN8NDecoder16TPredHuffDecoderILm8EEC2ERKN5NStat9TPredStatE
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.p2align	3, 0x0
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __gxx_personality_v0
	.addrsig_sym _Unwind_Resume
	.addrsig_sym _ZTVN10__cxxabiv120__si_class_type_infoE
	.addrsig_sym _ZTSN8NDecoder12THuffDecoderILm8EEE
	.addrsig_sym _ZTVN10__cxxabiv117__class_type_infoE
	.addrsig_sym _ZTS8IDecoder
	.addrsig_sym _ZTI8IDecoder
	.addrsig_sym _ZTIN8NDecoder12THuffDecoderILm8EEE
	.addrsig_sym _ZTSN8NDecoder16TPredHuffDecoderILm8EEE
	.addrsig_sym _ZTIN8NDecoder16TPredHuffDecoderILm8EEE
