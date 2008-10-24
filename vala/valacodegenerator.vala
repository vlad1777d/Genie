/* valacodegenerator.vala
 *
 * Copyright (C) 2007-2008  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;

/**
 * Abstract code visitor generating code.
 */
public class Vala.CodeGenerator : CodeVisitor {
	/**
	 * Generate and emit C code for the specified code context.
	 *
	 * @param context a code context
	 */
	public virtual void emit (CodeContext context) {
	}

	public virtual CodeBinding? create_dynamic_property_binding (DynamicProperty node) {
		return null;
	}

	public virtual CodeBinding? create_dynamic_signal_binding (DynamicSignal node) {
		return null;
	}

	public virtual CodeBinding? create_member_access_binding (MemberAccess node) {
		return null;
	}

	public virtual CodeBinding? create_invocation_expression_binding (InvocationExpression node) {
		return null;
	}

	public virtual CodeBinding? create_element_access_binding (ElementAccess node) {
		return null;
	}

	public virtual CodeBinding? create_assignment_binding (Assignment node) {
		return null;
	}
}
