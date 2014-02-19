package org.jacoco.core.internal.instr;
import static java.lang.String.format;
import org.jacoco.core.internal.flow.IClassProbesVisitor;
import org.jacoco.core.internal.flow.IMethodProbesVisitor;
import org.jacoco.core.runtime.IExecutionDataAccessorGenerator;
import org.objectweb.asm.ClassAdapter;
import org.objectweb.asm.ClassVisitor;
import org.objectweb.asm.FieldVisitor;
import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
public class ClassInstrumenter extends ClassAdapter implements IClassProbesVisitor
  {
    private static final Object[]                 STACK_ARRZ = new Object[] { InstrSupport.DATAFIELD_DESC };
    private static final Object[]                 NO_LOCALS  = new Object[0];
    private final long                            id;
    private final IExecutionDataAccessorGenerator accessorGenerator;
    private IProbeArrayStrategy                   probeArrayStrategy;
    private String                                className;
    private int                                   probeCount;
    public ClassInstrumenter(final long id, final IExecutionDataAccessorGenerator accessorGenerator, final ClassVisitor cv)
      {
        super(cv);
        this.id                = id;
        this.accessorGenerator = accessorGenerator;
      }
    @Override
    public void visit(final int version, final int access, final String name, final String signature, final String superName, final String[] interfaces)
      {
        this.className = name;
        if ((access & Opcodes.ACC_INTERFACE) == 0)
          {
            this.probeArrayStrategy = new ClassTypeStrategy();
          }
        else
          {
            this.probeArrayStrategy = new InterfaceTypeStrategy();
          }
        super.visit(version, access, name, signature, superName, interfaces);
      }
    @Override
    public FieldVisitor visitField(final int access, final String name, final String desc, final String signature, final Object value)
      {
        assertNotInstrumented(name, InstrSupport.DATAFIELD_NAME);
        return super.visitField(access, name, desc, signature, value);
      }
    @Override
    public IMethodProbesVisitor visitMethod(final int access, final String name, final String desc, final String signature, final String[] exceptions)
      {
        assertNotInstrumented(name, InstrSupport.INITMETHOD_NAME);
        final MethodVisitor mv = super.visitMethod(access, name, desc, signature, exceptions);
        if (mv == null)
          {
            return null;
          }
        return new MethodInstrumenter(mv, access, desc, probeArrayStrategy);
      }
    public void visitTotalProbeCount(final int count)
      {
        probeCount = count;
      }
    @Override
    public void visitEnd()
      {
        probeArrayStrategy.addMembers(cv);
        super.visitEnd();
      }
    private void assertNotInstrumented(final String member, final String instrMember) throws IllegalStateException
      {
        if (member.equals(instrMember))
          {
            throw new IllegalStateException(format("Class %s is already instrumented.", className));
          }
      }
    private class ClassTypeStrategy implements IProbeArrayStrategy
      {
        public int pushInstance(final MethodVisitor mv)
          {
            mv.visitMethodInsn(Opcodes.INVOKESTATIC, className, InstrSupport.INITMETHOD_NAME, InstrSupport.INITMETHOD_DESC);
            return 1;
          }
        public void addMembers(final ClassVisitor delegate)
          {
            createDataField();
            createInitMethod(probeCount);
          }
        private void createDataField()
          {
            cv.visitField(InstrSupport.DATAFIELD_ACC, InstrSupport.DATAFIELD_NAME, InstrSupport.DATAFIELD_DESC, null, null);
          }
        private void createInitMethod(final int probeCount)
          {
            final MethodVisitor mv = cv.visitMethod(InstrSupport.INITMETHOD_ACC, InstrSupport.INITMETHOD_NAME, InstrSupport.INITMETHOD_DESC, null, null);
            mv.visitCode();
            mv.visitFieldInsn(Opcodes.GETSTATIC, className, InstrSupport.DATAFIELD_NAME, InstrSupport.DATAFIELD_DESC);
            mv.visitInsn(Opcodes.DUP);
            final Label alreadyInitialized = new Label();
            mv.visitJumpInsn(Opcodes.IFNONNULL, alreadyInitialized);
            mv.visitInsn(Opcodes.POP);
            final int size = genInitializeDataField(mv, probeCount);
            mv.visitFrame(Opcodes.F_FULL, 0, NO_LOCALS, 1, STACK_ARRZ);
            mv.visitLabel(alreadyInitialized);
            mv.visitInsn(Opcodes.ARETURN);
            mv.visitMaxs(Math.max(size, 2), 0);
            mv.visitEnd();
          }
        private int genInitializeDataField(final MethodVisitor mv, final int probeCount)
          {
            final int size = accessorGenerator.generateDataAccessor(id, className, probeCount, mv);
            mv.visitInsn(Opcodes.DUP);
            mv.visitFieldInsn(Opcodes.PUTSTATIC, className, InstrSupport.DATAFIELD_NAME, InstrSupport.DATAFIELD_DESC);
            return Math.max(size, 2);
          }
      }
    private class InterfaceTypeStrategy implements IProbeArrayStrategy
      {
        public int pushInstance(final MethodVisitor mv)
          {
            return accessorGenerator.generateDataAccessor(id, className, probeCount, mv);
          }
        public void addMembers(final ClassVisitor delegate)
          {
          }
      }
  }
