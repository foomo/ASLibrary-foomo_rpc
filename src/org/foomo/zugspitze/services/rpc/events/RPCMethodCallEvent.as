/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package org.foomo.zugspitze.services.rpc.events
{
	import org.foomo.zugspitze.services.rpc.protocol.call.MethodCall;
	import org.foomo.zugspitze.services.rpc.protocol.reply.MethodReply;

	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.SecurityErrorEvent;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 * @author  jan <jan@bestbytes.de>
	 */
	public class RPCMethodCallEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const RPC_METHOD_CALL_COMPLETE:String = 'rpcMethodCallComplete';
		public static const RPC_METHOD_CALL_ERROR:String 	= 'rpcMethodCallError';

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public var methodReply:MethodReply;
		/**
		 *
		 */
		public var methodCall:MethodCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCMethodCallEvent(type:String, methodCall:MethodCall, methodReply:MethodReply=null)
		{
			this.methodCall	= methodCall;
			this.methodReply = methodReply;

			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCMethodCallEvent(this.type, this.methodCall, this.methodReply);
		}

		/**
		 * @inherit
		 */
		public override function toString():String
		{
			return formatToString("RPCMethodCallEvent");
		}
	}
}