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
	import flash.events.ErrorEvent;
	import flash.events.Event;

	import org.foomo.zugspitze.services.rpc.RPCTransport;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 * @author  jan <jan@bestbytes.de>
	 */
	public class RPCClientErrorEvent extends ErrorEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const RPC_TRANSPORT_ERROR:String 	= "rpcTransportError";
		public static const SECURITY_ERROR:String 		= "securityError";
		public static const IO_ERROR:String 			= "ioError";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _transport:RPCTransport;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCClientErrorEvent(type:String, transport:RPCTransport, text:String='')
		{
			this._transport = transport;
			super(type, false, false, text);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * The causing transport
		 */
		public function get transport():RPCTransport
		{
			return _transport;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCClientErrorEvent(type, transport, this.text);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("RPCClientErrorEvent", "transport", "text", "id");
		}
	}
}