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
package org.foomo.zugspitze.services.core.rpc
{
	import flash.events.Event;
	import flash.net.ObjectEncoding;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	import org.foomo.zugspitze.services.core.rpc.events.RPCTransportErrorEvent;
	import org.foomo.zugspitze.services.core.rpc.protocol.Reply;

	[Event(name="nullError", type="org.foomo.zugspitze.services.core.rpc.events.RPCTransportErrorEvent")]
	[Event(name="replyError", type="org.foomo.zugspitze.services.core.rpc.events.RPCTransportErrorEvent")]

	/**
	 * AMF based flash cient to PHP server communication over HTTP.
	 * Do not use this class directly - rely on reflection based auto generated service clients / proxies.
	 *
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 * @author  jan <jan@bestbytes.de>
	 */
	public class RPCTransport extends URLStream
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * Call endpoint
		 */
		protected var _endPoint:String;
		/**
		 * The send object data
		 */
		protected var _data:Object;
		/**
		 * The reply object
		 */
		protected var _reply:Reply;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCTransport(endPoint:String)
		{
			this.endPoint = endPoint;
			this.objectEncoding = ObjectEncoding.AMF0;
			this.addEventListener(Event.COMPLETE, this.completeHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public accessor methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Call endpoint
		 */
		public function get endPoint():String
		{
			return this._endPoint;
		}
		public function set endPoint(value:String):void
		{
			this._endPoint = value;
		}

		/**
		 * The send object data
		 */
		public function get data():Object
		{
			return this._data;
		}

		/**
		 * The reply object
		 */
		public function get reply():Reply
		{
			return this._reply;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Send data to given endpoint
		 */
		public function send(data:Object):void
		{
			this._data = data;

			var bytes:ByteArray = new ByteArray;
			bytes.objectEncoding = ObjectEncoding.AMF0;
			bytes.writeObject(this._data);

			var request:URLRequest = new URLRequest(this.endPoint);
			request.contentType = 'application/octet-stream';
			request.method = URLRequestMethod.POST;
			request.data = bytes;

			this.load(request);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Private eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * Catch the complete event first to validate the transport reply
		 */
		private function completeHandler(event:Event):void
		{
			if (this.bytesAvailable == 0) {
				this.dispatchEvent(new RPCTransportErrorEvent(RPCTransportErrorEvent.NULL_ERROR, 'Available bytes are 0'));
				event.stopImmediatePropagation();
				event.stopPropagation();
			} else {
				this._reply = this.readObject() as Reply;
				if (this._reply == null) {
					this.dispatchEvent(new RPCTransportErrorEvent(RPCTransportErrorEvent.REPLY_ERROR, 'Read object is not a Reply'));
					event.stopImmediatePropagation();
					event.stopPropagation();
				}
			}
		}
	}
}