/* valainvocationexpression.vala
 *
 * Copyright (C) 2006-2008  Jürg Billeter
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
using Gee;

/**
 * Represents an invocation expression in the source code.
 */
public class Vala.InvocationExpression : Expression {
	/**
	 * The method to call.
	 */
	public Expression call {
		get { return _call; }
		set construct {
			_call = value;
			_call.parent_node = this;
		}
	}

	public CCodeExpression delegate_target { get; set; }

	public Expression _call;
	
	private Gee.List<Expression> argument_list = new ArrayList<Expression> ();
	private Gee.List<CCodeExpression> array_sizes = new ArrayList<CCodeExpression> ();

	/**
	 * Creates a new invocation expression.
	 *
	 * @param call             method to call
	 * @param source_reference reference to source code
	 * @return                 newly created invocation expression
	 */
	public InvocationExpression (Expression call, SourceReference? source_reference = null) {
		this.source_reference = source_reference;
		this.call = call;
	}
	
	/**
	 * Appends the specified expression to the list of arguments.
	 *
	 * @param arg an argument
	 */
	public void add_argument (Expression arg) {
		argument_list.add (arg);
		arg.parent_node = this;
	}
	
	/**
	 * Returns a copy of the argument list.
	 *
	 * @return argument list
	 */
	public Gee.List<Expression> get_argument_list () {
		return new ReadOnlyList<Expression> (argument_list);
	}

	/**
	 * Add an array size C code expression.
	 */
	public void append_array_size (CCodeExpression size) {
		array_sizes.add (size);
	}

	/**
	 * Get the C code expression for array sizes for all dimensions
	 * ascending from left to right.
	 */
	public Gee.List<CCodeExpression> get_array_sizes () {
		return new ReadOnlyList<CCodeExpression> (array_sizes);
	}

	public override void accept (CodeVisitor visitor) {
		visitor.visit_invocation_expression (this);

		visitor.visit_expression (this);
	}

	public override void accept_children (CodeVisitor visitor) {
		call.accept (visitor);

		foreach (Expression expr in argument_list) {
			expr.accept (visitor);
		}
	}

	public override void replace_expression (Expression old_node, Expression new_node) {
		if (call == old_node) {
			call = new_node;
		}
		
		int index = argument_list.index_of (old_node);
		if (index >= 0 && new_node.parent_node == null) {
			argument_list[index] = new_node;
			new_node.parent_node = this;
		}
	}

	public override bool is_pure () {
		return false;
	}

	public override CodeBinding? create_code_binding (CodeGenerator codegen) {
		return codegen.create_invocation_expression_binding (this);
	}
}
