<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Get authenticated user.
     */
    public function me(Request $request)
    {
        return $request->user();
    }

    /**
     * DELETE NORMAL USER (ADMIN ONLY)
     */
    public function destroy(Request $request, $id)
    {
        // Only admin tokens
        abort_unless(
            $request->user()->tokenCan('products:manage'),
            403,
            'Unauthorized'
        );

        $user = User::findOrFail($id);

        // Prevent deleting admins
        if ($user->type === 'admin') {
            return response()->json([
                'message' => 'You cannot delete an admin user'
            ], 403);
        }

        $user->delete();

        return response()->json([
            'message' => 'User deleted successfully'
        ]);
    }
}
